//
//  EKYCWebView.swift
//  Fincart
//
//  Created by Ankit Bisht on 2/7/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class EKYCWebView: UIViewController,UIWebViewDelegate {
   
    var webView=UIWebView()
    var dimensions=Dimensions()
    var utils=Utils()
    var colors=Colors()
    var images=Images()
    var panDetails=String()
    var email=String()
    var aadhar=String()
    var mobile=String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNav()
        
        webView=UIWebView(frame:CGRect(x:0,y:0,width:dimensions.SCREEN_WIDTH,height:dimensions.SCREEN_HEIGHT))
        //webView.loadRequest(URLRequest(url:URL(string: "https://api.fincart.com/ekyc.aspx")!))
        webView.delegate = self
        
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        
        //let EKYC_URL = URL(string: FinCartMacros.kFinEKYCUrl);
        let EKYC_URL = URL(string:"https://api.fincart.com/ekyc.aspx")
        var request = URLRequest(url:EKYC_URL!)
        
        request.httpMethod = "POST"// Compose a query string
        
        let accessToken:String=finCartUserDefaults.retrieveAccessToken()!
        let basicId:String=finCartUserDefaults.retrieveBasicId()!
        
        let postString="authToken=WOLohY9GpRDDM-U_1okZc8YJkogLW1g-jCJBoPhv_QtwJRF4XfGt-NNBJhtGdsJFHV8JKD6Lk033zS77427EjD8QcYG2FYNFnQwWDMjz8pc_NI1ZkmL2zKsQ4gK4vBdUvuoKTGoi5SIFo8HNj5_M-gIrW9JVcq1ZTDx1XJaWtM187MbiA_l6WdqU8leiwmaforTqkc7axvrm2bdUfCa-U7sOAPPQbfel6oONeVEkC2gcnqCEBVU5XgwLMH_tgaS6hoVDFLTMtKk35ewxwLGlDBG9qAXgM7Omo7k4ZeYMZribVElfTNuuCy2DnChJ1P6uDl89e30mHg1O3sIAFammyJCN5lafpX9SFhM-ODdmEU1E5kK5jYjAjYg5rjugrdwC&appData=257054|ADS.MAKJAd|test@gmail.coms|dds|8512801989|02"
        //let postString = "authToken=\(accessToken)&appData=\(basicId)|\(panDetails)|\(email)|\(aadhar)|\(mobile)|02";
        print(EKYC_URL!)
        print(postString)
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        self.webView.loadRequest(request)
        
        view.addSubview(webView)
        
        // Do any additional setup after loading the view.
    }
    
    func addNav()
    {
        self.navigationController?.navigationBar.isHidden=false
        self.navigationController?.navigationBar.isTranslucent=false
        self.navigationItem.title="E-KYC"
        self.navigationController?.navigationBar.barTintColor=colors.APP_THEME_COLOR
        self.navigationController?.navigationBar.layer.shadowColor=UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity=0.5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        self.navigationController?.navigationBar.layer.masksToBounds=false
        self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:colors.NAV_TITLE_COLOR]
        let back_btn=UIButton(frame:CGRect(x:0,y:0,width:10,height:10))
        back_btn.setImage(images.backBtn, for: UIControlState.normal)
        back_btn.addTarget(self, action: #selector(KYCInvestorTypeVC.backAction(_:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: back_btn)
    }
    func backAction(_ sender:UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        //        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        //        SVProgressHUD.show(withStatus: "Loading...")
    }
   
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        SVProgressHUD.dismiss()
        let errorUserDefaults=UserDefaults.standard
        errorUserDefaults.synchronize()
        print(webView.stringByEvaluatingJavaScript(from: "document.documentElement.innerText")!)
        let jsonString = webView.stringByEvaluatingJavaScript(from: "document.documentElement.innerText")!
        if((jsonString as NSString).range(of: "Invalid Pan", options: .caseInsensitive).location != NSNotFound){
            errorUserDefaults.set(("Invalid Pan Number"), forKey: "error")
            
            _ = self.navigationController?.popViewController(animated: true)
        }
        else if((jsonString as NSString).range(of: "KYC record not available", options: .caseInsensitive).location != NSNotFound){
            errorUserDefaults.set(("KYC record not available"), forKey: "error")
            
            _ = self.navigationController?.popViewController(animated: true)
            
        }
        else if((jsonString as NSString).range(of: "Aadhar number not", options: .caseInsensitive).location != NSNotFound){
            errorUserDefaults.set(("Aadhar number not a valid logic based on algorithm validation."), forKey: "error")
            
            _ = self.navigationController?.popViewController(animated: true)
            
        }
        else if((jsonString as NSString).range(of: "Please provide Mobile / Email", options: .caseInsensitive).location != NSNotFound){
            errorUserDefaults.set(("Please provide Mobile/Email as in aadhar records for sending OTP. If you have already provided the details, then contact support"), forKey: "error")
            
            _ = self.navigationController?.popViewController(animated: true)
            
        }
        else if((jsonString as NSString).range(of: "KYC already completed", options: .caseInsensitive).location != NSNotFound){
            errorUserDefaults.set(("KYC already completed!!"), forKey: "error")
            
            _ = self.navigationController?.popViewController(animated: true)
            
        }
        else if((jsonString as NSString).range(of: "KRA is not available", options: .caseInsensitive).location != NSNotFound){
            errorUserDefaults.set(("Connectivity to a KRA is not available. Please try after some time"), forKey: "error")
            
            _ = self.navigationController?.popViewController(animated: true)
            
        }
        let scheme: String? = webView.request?.url?.scheme
        let Path: String? = webView.request?.url?.path
        let PathComponents: [Any]? = webView.request?.url?.pathComponents
        let PathExtension: String? = webView.request?.url?.pathExtension
        
        print(scheme ?? "Defaut")
        print(Path ?? "Defaut")
        print(PathComponents ?? "Defaut")
        print(PathExtension ?? "Defaut")
        
        
    }
    override func didReceiveMemoryWarning() {
        self.webView.reload()
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

