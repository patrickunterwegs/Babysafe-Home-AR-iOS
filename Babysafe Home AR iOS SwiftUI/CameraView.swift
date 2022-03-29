//
//  CameraView.swift
//  Babysafe Home AR iOS SwiftUI
//
//  Created by Patrick Lang on 29.03.22.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
    
    var body: some View {
        ZStack {
            CameraPreview(camera: camera)
            //Color.black.ignoresSafeArea(.all, edges: .all)
            //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).foregroundColor(.white)
        }
        .onAppear(perform: {
            camera.checkPermission()
        })
        
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}



// camera model
class CameraModel: ObservableObject {
    
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var preview: AVCaptureVideoPreviewLayer!
    
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
            
            // not handling output, if necessary check video again!!!
            // https://www.youtube.com/watch?v=8hvaniprctk
            
            self.session.commitConfiguration()
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
    
}


// setting view for preview

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
