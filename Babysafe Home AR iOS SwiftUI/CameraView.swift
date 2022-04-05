//
//  CameraView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 29.03.22.
//

import SwiftUI
import AVFoundation
import Vision
import CoreVideo
import MLImage
import MLKit
import BottomSheet

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
    
    @EnvironmentObject var model: BabysafeViewModel
    
    
    var body: some View {
        VStack {
            ZStack {
                
                CameraPreview(camera: camera)
                    .onReceive(model.$newDangerDetected, perform: { detected in
                        if detected {
                            camera.session.stopRunning()
                            model.bottomSheetPosition = .middle
                        } else {
                            camera.session.startRunning()
                            model.bottomSheetPosition = .bottom
                        }
                    })
                Spacer()
                GroupBox {
                    HStack {
                        Text(String(camera.objectIdentifier))
                    }
                }
            }
        }.onAppear(perform: {
            camera.checkPermission()
            model.resetCurDetected()
        })
        .onDisappear(perform: {
            camera.session.stopRunning()
        })
        .bottomSheet(
            bottomSheetPosition: $model.bottomSheetPosition,
            options: [
                .cornerRadius(16),
                .showCloseButton(action: {
                    model.newDangerDetected = false
                    model.resetCurDetected()
                    
                }),
                //.swipeToDismiss,
                .tapToDismiss,
                .appleScrollBehavior,
                //.notResizeable
                //.allowContentDrag
            ],
            title: String(localized: "ar_found_dangers"), content: {
                ScrollView {
                    VStack(alignment: .center) {
                        
                        ForEach($model.babyDangers) { $babyDanger in
                            if(babyDanger.isCurDetected) {
                                ChecklistItemView(babyDanger: $babyDanger, selectedShop: $model.selectedShop)
                            }
                        }
                    }.background()
                }
            }
        )
        .onReceive(model.$bottomSheetPosition, perform: { position in
            
            if (position == .bottom || position == .hidden) && model.newDangerDetected {
                model.newDangerDetected = false
                model.resetCurDetected()
            }
        })
    }
    
    
    struct CameraView_Previews: PreviewProvider {
        static var previews: some View {
            CameraView().environmentObject(BabysafeViewModel())
        }
    }
    
    // https://www.youtube.com/watch?v=8hvaniprctk
    
    // camera model
    class CameraModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
        
        @Published var session = AVCaptureSession()
        @Published var alert = false
        @Published var preview: AVCaptureVideoPreviewLayer!
        @Published var output = AVCaptureVideoDataOutput()
        
        @Published var model: BabysafeViewModel!   // is set when the CameraModel gets instantiated
        
        
        @Published var objectIdentifier: String = ""
        
        
        func checkPermission() {
            
            switch AVCaptureDevice.authorizationStatus(for: .video) {
                
            case .notDetermined:
                //requesting permission
                AVCaptureDevice.requestAccess(for: .video) { (status) in
                    
                    if status {
                        self.setUp()
                    }
                }
            case .denied:
                self.alert.toggle()
                return
            case .authorized:
                setUp()
                return
            default:
                return
            }
        }
        
        func setUp() {
            // setting up camera
            
            do {
                // setting configs
                self.session.beginConfiguration()
                
                let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
                let input = try AVCaptureDeviceInput(device: device!)
                
                if self.session.canAddInput(input) {
                    self.session.addInput(input)
                }
                
                // same for output
                if self.session.canAddOutput(self.output) {
                    output.alwaysDiscardsLateVideoFrames = true
                    output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "CameraView"))
                    self.session.addOutput(self.output)
                }
                
                self.session.commitConfiguration()
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        
        func captureOutput(
            _ output: AVCaptureOutput,
            didOutput sampleBuffer: CMSampleBuffer,
            from connection: AVCaptureConnection
        ) {
            guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
                print("Failed to get image buffer from sample buffer.")
                return
            }
            
            //lastFrame = sampleBuffer
            let visionImage = VisionImage(buffer: sampleBuffer)
            let orientation = CameraView.CameraModel.imageOrientation(fromDevicePosition: .back)
            visionImage.orientation = orientation
            
            let imageWidth = CGFloat(CVPixelBufferGetWidth(imageBuffer))
            let imageHeight = CGFloat(CVPixelBufferGetHeight(imageBuffer))
            
            detectLabels(
                in: visionImage, width: imageWidth, height: imageHeight)
        }
        
        
        func detectLabels(
            in visionImage: VisionImage,
            width: CGFloat,
            height: CGFloat
        ) {
            
            guard
                let localModelFilePath = Bundle.main.path(
                    forResource: Constant.localModelFile.name,
                    ofType: Constant.localModelFile.type
                )
            else {
                print("On-Device label detection failed because custom model was not found.")
                return
            }
            
            let localModel = LocalModel(path: localModelFilePath)
            let options = CustomObjectDetectorOptions(localModel: localModel)
            options.detectorMode = .singleImage
            options.shouldEnableClassification = true
            options.shouldEnableMultipleObjects = false
            options.classificationConfidenceThreshold = NSNumber(floatLiteral: Constant.labelConfidenceThreshold)
            options.maxPerObjectLabelCount = Constant.labelMaxResultCount
            
            
            let objectDetector = ObjectDetector.objectDetector(options: options)
            var objects: [Object]
            do {
                objects = try objectDetector.results(in: visionImage)
            } catch let error {
                // Handle the error.
                return
            }
            
            
            // only for debugging!
            let resultsText = objects.first?.labels.map { label -> String in
                return "Label: \(label.text), Confidence: \(label.confidence), Index: \(label.index)"
            }.joined(separator: "\n")
            
            //self.updatePreviewOverlayViewWithLastFrame()
            
            guard resultsText?.count != 0 else { return }
            
            weak var weakSelf = self
            DispatchQueue.main.sync {
                
                // Check labels and update UI here!!!
                print(resultsText)
                objectIdentifier = resultsText ?? "nothing found"
                
                objects.first?.labels.forEach { label in
                    model.unlock(objectId: label.index)
                }
            }
        }
        
        
        public static func imageOrientation(
            fromDevicePosition devicePosition: AVCaptureDevice.Position = .back
        ) -> UIImage.Orientation {
            var deviceOrientation = UIDevice.current.orientation
            if deviceOrientation == .faceDown || deviceOrientation == .faceUp
                || deviceOrientation
                == .unknown
            {
                deviceOrientation = currentUIOrientation()
            }
            switch deviceOrientation {
            case .portrait:
                return devicePosition == .front ? .leftMirrored : .right
            case .landscapeLeft:
                return devicePosition == .front ? .downMirrored : .up
            case .portraitUpsideDown:
                return devicePosition == .front ? .rightMirrored : .left
            case .landscapeRight:
                return devicePosition == .front ? .upMirrored : .down
            case .faceDown, .faceUp, .unknown:
                return .up
            @unknown default:
                fatalError()
            }
        }
        
        
        private static func currentUIOrientation() -> UIDeviceOrientation {
            let deviceOrientation = { () -> UIDeviceOrientation in
                switch UIApplication.shared.statusBarOrientation {
                case .landscapeLeft:
                    return .landscapeRight
                case .landscapeRight:
                    return .landscapeLeft
                case .portraitUpsideDown:
                    return .portraitUpsideDown
                case .portrait, .unknown:
                    return .portrait
                @unknown default:
                    fatalError()
                }
            }
            guard Thread.isMainThread else {
                var currentOrientation: UIDeviceOrientation = .portrait
                DispatchQueue.main.sync {
                    currentOrientation = deviceOrientation()
                }
                return currentOrientation
            }
            return deviceOrientation()
        }
        
    }
    
    
    // setting view for preview view to use in UI
    
    struct CameraPreview: UIViewRepresentable {
        
        @ObservedObject var camera: CameraModel
        @EnvironmentObject var model: BabysafeViewModel
        
        
        func makeUIView(context: Context) -> UIView {
            let view = UIView(frame: UIScreen.main.bounds)
            camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
            camera.preview.frame = view.frame
            
            camera.model = model       // pass on the model to the CameraModel to manipulate it when dangers get unlocked
            
            camera.preview.videoGravity = .resizeAspectFill
            view.layer.addSublayer(camera.preview)
            
            // start session
            camera.session.startRunning()
            
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {   }
        
    }
    
    
    
    private enum Constant {
        static let videoDataOutputQueueLabel = "com.google.mlkit.visiondetector.VideoDataOutputQueue"
        static let sessionQueueLabel = "com.google.mlkit.visiondetector.SessionQueue"
        static let localModelFile = (name: "lite-model_object_detection_mobile_object_labeler_v1_1", type: "tflite")
        static let labelConfidenceThreshold = 0.9
        static let labelMaxResultCount = 3
        
    }
}
