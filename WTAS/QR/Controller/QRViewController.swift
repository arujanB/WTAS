//
//  QRViewController.swift
//  WTAS
//
//  Created by Aruzhan Boranbay on 18.08.2023.
//

import UIKit
import SnapKit
import AVFoundation

class QRViewController: UIViewController {
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    private lazy var titleName: UILabel = {
        let title = UILabel()
        title.text = "Сканирование"
        title.font = .boldSystemFont(ofSize: 20)
        return title
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(image: UIImage(named: "home"))
        backgroundImage.contentMode = .scaleAspectFill
        
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        setUpViews()
        setUPConstrints()
        setScanner()
    }
    
}

//MARK: - qr code AVCaptureMetadataOutputObjectsDelegate
extension QRViewController: AVCaptureMetadataOutputObjectsDelegate {
    
}

//MARK: - setUPViews() and setUpConstraints()
extension QRViewController {
    func setUpViews(){
        view.addSubview(titleName)
    }
    
    func setUPConstrints(){
        titleName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
    }
    
    func setScanner() {
        captureSession = AVCaptureSession()
              
              guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
              let videoInput: AVCaptureDeviceInput
              
              do {
                  videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
              } catch {
                  return
              }
              
              if captureSession.canAddInput(videoInput) {
                  captureSession.addInput(videoInput)
              } else {
                  failed()
                  return
              }
              
              let metadataOutput = AVCaptureMetadataOutput()
              
              if captureSession.canAddOutput(metadataOutput) {
                  captureSession.addOutput(metadataOutput)
                  
                  metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                  metadataOutput.metadataObjectTypes = [.qr]
              } else {
                  failed()
                  return
              }
          }
          
          func failed() {
              let alert = UIAlertController(title: "Scanner not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default))
              present(alert, animated: true)
              captureSession = nil
          }
          
          func setupUI() {
              let scannerView = UIView()
              view.addSubview(scannerView)
              
              scannerView.snp.makeConstraints { make in
                  make.center.equalToSuperview()
                  make.width.height.equalTo(250)
              }
              
              previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
              previewLayer.frame = scannerView.bounds
              scannerView.layer.addSublayer(previewLayer)
              
              captureSession.startRunning()
          }
          
          // AVCaptureMetadataOutputObjectsDelegate method to handle detected metadata
          func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
              if let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
                 let qrCodeStringValue = metadataObject.stringValue {
                  // Handle the detected QR code value
                  print("Detected QR Code: \(qrCodeStringValue)")
                  
                  // Stop the capture session
                  captureSession.stopRunning()
              }
          }
    
}
