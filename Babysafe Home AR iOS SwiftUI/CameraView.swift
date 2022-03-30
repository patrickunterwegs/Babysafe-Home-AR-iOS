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

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
    @State private var isChecklistSheetPresented: Bool = false
    
    @EnvironmentObject var model: BabysafeViewModel

    
    
    var body: some View {
        VStack {
            ZStack {
                CameraPreview(camera: camera)
                //Color.black.ignoresSafeArea(.all, edges: .all)
                //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                    .sheet(isPresented: $isChecklistSheetPresented, onDismiss: {
                        print("Dismiss")
                        self.isChecklistSheetPresented = false
                        
                    }, content: {
                        VStack {
                            Text(String(camera.objectIdentifier))
                        }
                    }).padding(8)
            }
            
            .onAppear(perform: {
                camera.checkPermission()
                //isChecklistSheetPresented = true       // JUST FOR TESTING!!!
            })
            .onDisappear(perform: {
                camera.session.stopRunning()
            })
            
            Spacer()
            GroupBox {
                HStack {
                    Text(String(camera.objectIdentifier))
                }
            }
        }
    }
    
    
    struct CameraView_Previews: PreviewProvider {
        static var previews: some View {
            CameraView().environmentObject(BabysafeViewModel())
        }
    }
    
    
    
    // https://www.youtube.com/watch?v=8hvaniprctk
    
    // camera model
    class CameraModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
        
        @EnvironmentObject var model: BabysafeViewModel
        
        @Published var session = AVCaptureSession()
        @Published var alert = false
        @Published var preview: AVCaptureVideoPreviewLayer!
        @Published var output = AVCaptureVideoDataOutput()
        
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
            //let orientation = UIUtilities.imageOrientation(fromDevicePosition: .back)
            //visionImage.orientation = orientation
            
            guard let inputImage = MLImage(sampleBuffer: sampleBuffer) else {
                print("Failed to create MLImage from sample buffer.")
                return
            }
            //inputImage.orientation = orientation
            
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
            
            // load local model
            var options: CommonImageLabelerOptions!
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
            options = CustomImageLabelerOptions(localModel: localModel)
            options.confidenceThreshold = NSNumber(floatLiteral: Constant.labelConfidenceThreshold)
            
            let onDeviceLabeler = ImageLabeler.imageLabeler(options: options)
            let labels: [ImageLabel]
            do {
                labels = try onDeviceLabeler.results(in: visionImage)
            } catch let error {
                let errorString = error.localizedDescription
                print("On-Device label detection failed with error: \(errorString)")
                //self.updatePreviewOverlayViewWithLastFrame()
                return
            }
            
            let resultsText = labels.map { label -> String in
                return "Label: \(label.text), Confidence: \(label.confidence), Index: \(label.index)"
            }.joined(separator: "\n")
            
            //self.updatePreviewOverlayViewWithLastFrame()
            
            guard resultsText.count != 0 else { return }
            
            weak var weakSelf = self
            DispatchQueue.main.sync {
                
                // Check labels and update UI here!!!
                print(resultsText)
                objectIdentifier = resultsText
                
            }
        }
    }
    
    
    // setting view for preview view to use in UI
    
    struct CameraPreview: UIViewRepresentable {
        
        @ObservedObject var camera: CameraModel
        
        func makeUIView(context: Context) -> UIView {
            let view = UIView(frame: UIScreen.main.bounds)
            camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
            camera.preview.frame = view.frame
            
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
      static let labelConfidenceThreshold = 0.8

    }
}
