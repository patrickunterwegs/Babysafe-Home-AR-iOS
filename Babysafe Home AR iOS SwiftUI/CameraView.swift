//
//  CameraView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 29.03.22.
//

import SwiftUI
import AVFoundation
import Vision

struct CameraView: View {
    

    
    @StateObject var camera = CameraModel()
    @State private var isChecklistSheetPresented: Bool = false
    
    
    
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
                            Text(String(camera.objectConfidence))
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
                    Text(String(camera.objectConfidence))
                }
            }
        }
        
        
        
    }
    
    
    struct CameraView_Previews: PreviewProvider {
        static var previews: some View {
            CameraView()
        }
    }
    
    
    
    // https://www.youtube.com/watch?v=8hvaniprctk
    
    // camera model
    class CameraModel: NSObject, ObservableObject, AVCaptureVideoDataOutputSampleBufferDelegate {
        
       
        @Published var session = AVCaptureSession()
        @Published var alert = false
        @Published var preview: AVCaptureVideoPreviewLayer!
        @Published var output = AVCaptureVideoDataOutput()
        
        @Published var objectIdentifier: String = ""
        @Published var objectConfidence: VNConfidence = 0
                
        
        //let model = MobileNetV2().model
        let model = SqueezeNet().model
        
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
        
        func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
            
            guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
            guard let model = try? VNCoreMLModel(for: self.model) else { return }
            
            let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
                
                guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
                //guard let firstObservation = results.first else { return }
                
                DispatchQueue.main.async {
                    
                    results.forEach{  result in
                        if result.confidence > 0.7 {
                            print("Identifier \(result.identifier)")
                            print("Confidence \(result.confidence * 100)")
                            
                            self.objectIdentifier = result.identifier
                            self.objectConfidence = result.confidence
                        }
                    }
                }
            }
            
            try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
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
}
