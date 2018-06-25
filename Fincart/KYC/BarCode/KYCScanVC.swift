//
//  KycScanVC.swift
//  Fincart
//
//  Created by Ankit Bisht on 1/31/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import SwiftyButton
import AVFoundation

class KycScanVC: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    
    var dimensions=Dimensions()
    var video=AVCaptureVideoPreviewLayer()
    var uid=String()
    var colors=Colors()
    var utils=Utils()
    var images=Images()
    var check=Int()
    var house=String()
    var street=String()
    var loc=String()
    var vtc=String()
    var po=String()
    var dist=String()
    var subdist=String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let back_btn=UIButton(frame:CGRect(x:15,y:30,width:40,height:30))
        back_btn.setImage(images.backBtn, for: UIControlState.normal)
        back_btn.addTarget(self, action: #selector(KycScanVC.backAction(_:)), for: UIControlEvents.touchUpInside)
        
        self.addNav()
        
        
        let session=AVCaptureSession()
        
        let captureDevice=AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            let input=try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        }
        catch{
            print("ERROR")
        }
        let output=AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes=[.qr]
        
        video=AVCaptureVideoPreviewLayer(session:session)
        video.frame=view.layer.bounds
        view.layer.addSublayer(video)
        
        let lbl=UILabel(frame:CGRect(x:10,y:dimensions.SCREEN_HEIGHT-40,width:dimensions.SCREEN_WIDTH-20,height:20))
        lbl.text="Scan a Aadharcard QR Code"
        lbl.textAlignment = .center
        lbl.textColor=UIColor.white
        
        view.addSubview(lbl)
        view.addSubview(back_btn)
        session.startRunning()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        check=0
        self.navigationController?.navigationBar.isHidden=true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addNav()
    {
        self.navigationController?.navigationBar.isHidden=true
       
    }
    @objc func backAction(_ sender:UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if check == 1{
            return
        }
        
        if metadataObjects != nil && metadataObjects.count != 0{
            if let object  = metadataObjects[0] as? AVMetadataMachineReadableCodeObject{
                if object.type == .qr{
                    
                    check=1
                    let resoponseString = object.stringValue
                    print(resoponseString!)
                    let parser = MyParser(xml: resoponseString!)
                    let barcodes = parser.parseXML() // array of barcodes
                    
   
                    if barcodes.first?.street.isEmpty == false {
                        self.street=(barcodes.first?.street)!
                    }
                    if barcodes.first?.house.isEmpty == false {
                        self.house=(barcodes.first?.house)!
                    }
                    if barcodes.first?.loc.isEmpty == false {
                        self.loc=(barcodes.first?.loc)!
                    }
                    
                    if barcodes.first?.vtc.isEmpty == false {
                        self.vtc=(barcodes.first?.vtc)!
                    }
                    
                    if barcodes.first?.po.isEmpty == false {
                        self.po=(barcodes.first?.po)!
                    }
                    
                    if barcodes.first?.dist.isEmpty == false {
                        self.dist=(barcodes.first?.dist)!
                    }
                    
                    if barcodes.first?.subdist.isEmpty == false {
                        self.subdist=(barcodes.first?.subdist)!
                    }
                    var address=String()
                    address="\(self.house),\(self.street),\(self.loc),\(self.vtc),\(self.po),\(self.dist),\(self.subdist)"
                    
                    FinCartUserDefaults.sharedInstance.saveAddress(address)
                    if barcodes.first?.dob.isEmpty == false {
                        FinCartUserDefaults.sharedInstance.saveDob(barcodes.first?.dob)
                    }
                    if barcodes.first?.state.isEmpty == false {
                        FinCartUserDefaults.sharedInstance.saveState(barcodes.first?.state)
                    }
                    if barcodes.first?.loc.isEmpty == false {
                        FinCartUserDefaults.sharedInstance.saveCity(barcodes.first?.loc)
                    }
                    if barcodes.first?.pc.isEmpty == false {
                        FinCartUserDefaults.sharedInstance.savePincode(barcodes.first?.pc)
                    }
                    print(address)
                   
                    if check == 1 {
                        let controller=self.storyboard?.instantiateViewController(withIdentifier: "KycBasicDetailsFormVC") as! KycBasicDetailsFormVC
                        self.navigationController?.pushViewController(controller, animated: true)
                        
                    }
                    
                }
            }
        }
    }
}

