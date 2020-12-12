//
//  SecondViewController.swift
//  ISMOriginalWork
//
//  Created by Gauri Pala on 10/27/20.
//  Copyright © 2020 Gauri Pala. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import Vision

class ScanViewController: UIViewController,AVCaptureVideoDataOutputSampleBufferDelegate {


    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var prediction = ""
    let captureSession = AVCaptureSession()
    var takePhoto = false
    var index = 0
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //set up camera
//            let captureSession = AVCaptureSession()
            
            //capture button
            
            
            
            
            guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
            guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
            captureSession.addInput(input)
            
            captureSession.startRunning()
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.frame = UIScreen.main.bounds
            previewLayer.videoGravity = .resizeAspectFill
            view.layer.addSublayer(previewLayer)
            let buttonLayer:UIView = captureButton
            view.addSubview(buttonLayer)
            //previewLayer.frame = view.frame
            
            
            //analyze what camera is showing us
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
            captureSession.addOutput(dataOutput)
            
            
            //label.text = prediction

            
        }
        @IBAction func captureButtonAction(_ sender: Any) {
            takePhoto = true
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "scanPop"){
            let popUpVar = segue.destination as! ScanPopUpViewController
            popUpVar.prediction = prediction
            popUpVar.index = index
        }
    }
    
        func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
            guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
            guard let model = try? VNCoreMLModel(for: ISMRecyclingProject().model) else {return}
            let request = VNCoreMLRequest(model: model) { (finishedReq, error) in
               // print(finishedReq.results)
                guard let results = finishedReq.results as? [VNClassificationObservation] else {return}
                guard let firstObv = results.first else {return}
                
                if(firstObv.confidence <= 0.9){
                    DispatchQueue.main.async {
                        //self.label.text = "Trash"
                        if self.takePhoto == true{
                            self.captureSession.stopRunning()
                            let generator = UIImpactFeedbackGenerator(style: .heavy)
                            generator.impactOccurred()
                            self.performSegue(withIdentifier: "scanPop", sender: self)
                        }
                        self.takePhoto = false
                        self.captureSession.startRunning()
                    }
                }
                else {
                    if(firstObv.identifier == "plastic"){
                        self.index = 1
                        self.prediction = "Recyclable"
                    }
                    if(firstObv.identifier == "glass"){
                        self.index = 2
                        self.prediction = "Recyclable"
                    }
                    if(firstObv.identifier == "cardboard"){
                        self.index = 3
                        self.prediction = "Recyclable"
                    }
                    if(firstObv.identifier == "metal"){
                        self.index = 4
                        self.prediction = "Recyclable"
                    }
                    if(firstObv.identifier == "paper"){
                        self.index = 5
                        self.prediction = "Recyclable"
                    }
                    if(firstObv.identifier == "styrofoam"){
                        self.index = 6
                        self.prediction = "Recyclable"
                    }
                    if(firstObv.identifier == "clothes"){
                        self.index = 7
                        self.prediction = "Recyclable"
                    }
                    if(firstObv.identifier == "battery"){
                        self.index = 8
                        self.prediction = "Recyclable"
                    }
                    if(firstObv.identifier == "plastic bag"){
                        self.index = 9
                        self.prediction = "Recyclable"
                    }
                    if(firstObv.identifier == "Organic Waste"){
                        self.index = 10
                        self.prediction = firstObv.identifier
                    }
                    let confi = String(firstObv.confidence)
                    DispatchQueue.main.async { // Correct
                        //self.label.text = "\(firstObv.identifier) \(confi)"
                        if self.takePhoto == true{
                            self.captureSession.stopRunning()
                            let generator = UIImpactFeedbackGenerator(style: .heavy)
                            generator.impactOccurred()
                            self.performSegue(withIdentifier: "scanPop", sender: self)
                        }
                        self.takePhoto = false
                        self.captureSession.startRunning()
                        
                    }
                }
            }
            try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        }
        


    }
