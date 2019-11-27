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
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    var previewLayer: CALayer?
    var photoDeviceOutput = AVCapturePhotoOutput()
    var compressedFileData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSession()
    }
    
    @IBAction func takePhotoOnTouchUpInside(_ sender: Any) {
        capturePhotoWithSettings()
    }
    
    func setSession() {
        captureSession.beginConfiguration()
        captureSession.sessionPreset = .photo       // to get the best photo quality for the user's device
        setCaptureDevice()
        setPreviewLayer()
        captureSession.commitConfiguration()
        captureSession.startRunning()
    }
    
    func setCaptureDevice() {
        // looking for a video device (back camera)
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            fatalError("Missing expected back camera device.")
        }
        // setting the back camera as video device input
        guard let cameraDeviceInput = try? AVCaptureDeviceInput(device: videoDevice), captureSession.canAddInput(cameraDeviceInput) else { return }
        captureSession.addInput(cameraDeviceInput)      // adding the back camera to the session as input device
        
        guard captureSession.canAddOutput(self.photoDeviceOutput) else { return }       // adding photo as the type of output media
        captureSession.addOutput(photoDeviceOutput)
    }
    
    func setPreviewLayer() {
           cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)   // adding the capture session as the session on the preview layer
           cameraPreviewLayer?.videoGravity = .resizeAspectFill
           cameraPreviewLayer?.frame = self.view.bounds
           previewLayer = cameraPreviewLayer
           
           self.view.layer.addSublayer(previewLayer!)     //  what makes the camera preview layer to be displayed
           self.view.bringSubviewToFront(takePictureButton)    // brings the Take Pictures button to the front layer
    }
    
    func capturePhotoWithSettings() {
        let photoSettings: AVCapturePhotoSettings
        if self.photoDeviceOutput.availablePhotoCodecTypes.contains(.hevc) {
            photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc])
        } else {
            photoSettings = AVCapturePhotoSettings()
        }
        
        photoSettings.isAutoStillImageStabilizationEnabled = true
        photoDeviceOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    
    func displayCapturedPhoto(capturedPhoto: UIImage) {
        let imagePreviewViewController = storyboard?.instantiateViewController(withIdentifier: "ImagePreviewViewController") as! ImagePreviewViewController
        imagePreviewViewController.capturedImage = capturedPhoto
        navigationController?.pushViewController(imagePreviewViewController, animated: true)
    }
}

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    
    // to retrieve the processed photo
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let previewPhoto = photo.fileDataRepresentation() else { return }

        let finalImage = UIImage(data: previewPhoto)!
        displayCapturedPhoto(capturedPhoto: finalImage)
    }

    // to turn off the shutter sound when clicking to take the photo
    func photoOutput(_ output: AVCapturePhotoOutput, willCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
        AudioServicesDisposeSystemSoundID(1108)
    }
}
