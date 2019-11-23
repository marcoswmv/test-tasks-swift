//
//  CameraViewController.swift
//  TestTask6
//
//  Created by Marcos Vicente on 20.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    @IBOutlet weak var takePictureButton: UIButton!
    
    let captureSession = AVCaptureSession()
    var captureDevice: AVCaptureDevice?
    var previewLayer: CALayer?
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    var captureDeviceOutput: AVCapturePhotoOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCamera()
    }
    
    @IBAction func takePhotoOnTouchUpInside(_ sender: Any) {
        takePicture()
    }
    
    func prepareCamera() {
        captureSession.sessionPreset = .photo
        
        if let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back).devices.first {
            captureDevice = availableDevices
            beginSession()
        }
    }
    
    func beginSession() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice!)
            captureDeviceOutput = AVCapturePhotoOutput()
            
            captureSession.addInput(captureDeviceInput)
            captureSession.addOutput(captureDeviceOutput!)
        } catch {
            print(error.localizedDescription)
        }
        
        configureCameraPreviewlayer()
    }
    
    func configureCameraPreviewlayer() {
        cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        cameraPreviewLayer?.videoGravity = .resizeAspectFill
        cameraPreviewLayer?.frame = self.view.bounds
        self.previewLayer = cameraPreviewLayer
        self.view.layer.addSublayer(self.previewLayer!)     //  what makes the camera preview layer to be displayed
        self.view.bringSubviewToFront(takePictureButton)    // brings the Take Pictures button to the front layer
        
        captureSession.startRunning()
    }
    
    func takePicture() {
        let settings = AVCapturePhotoSettings()
        settings.isAutoStillImageStabilizationEnabled = true
        captureDeviceOutput?.capturePhoto(with: settings, delegate: self)
    }
    
    func displayCapturedPhoto(capturedPhoto: UIImage) {
        let imagePreviewViewController = storyboard?.instantiateViewController(withIdentifier: "ImagePreviewViewController") as! ImagePreviewViewController
        imagePreviewViewController.capturedImage = capturedPhoto
        navigationController?.pushViewController(imagePreviewViewController, animated: true)
    }
}


extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if let unwrappedError = error {
            print(unwrappedError.localizedDescription)
        } else {
            if let sampleBuffer = photoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewPhotoSampleBuffer) {
                if let finalImage = UIImage(data: dataImage) {
                    displayCapturedPhoto(capturedPhoto: finalImage)
                }
            }
        }
    }
}
