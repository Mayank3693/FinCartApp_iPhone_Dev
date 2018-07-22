//
//  SummaryVC.swift
//  Fincart
//
//  Created by mayank on 19/07/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class SummaryVC: FinCartViewController,UIGestureRecognizerDelegate{
    
   
    @IBOutlet weak var pieView: UIView!
    @IBOutlet weak var investAmount: UILabel!
    @IBOutlet weak var worthAmount: UILabel!
    @IBOutlet weak var gainAmount: UILabel!
    @IBOutlet weak var cagrAmount: UILabel!
    
    @IBOutlet weak var investView: UIView!
    @IBOutlet weak var worthView: UIView!
    @IBOutlet weak var gainView: UIView!
    @IBOutlet weak var cagr: UIView!
    @IBOutlet weak var popUpView: UIView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var summaryData   =  [String : Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        self.popUpView.isHidden   =   true
        self.setUpPieChart()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpBackButton()
        setupOpaqueNavigationBar()
        self.callGetSummaryApi(urlStr: FinCartMacros.kMapSummaryList, apiName: "")
    }

    override func viewDidLayoutSubviews() {
        self.setOpacity(view: self.investView)
        self.setOpacity(view: self.worthView)
        self.setOpacity(view: self.gainView)
        self.setOpacity(view: self.cagr)
    }
    func setUpPieChart(){
        let pieChartView = PieChartView()
        pieChartView.layer.layoutIfNeeded()
        pieChartView.frame = CGRect(x: 90, y: 60, width: pieView.frame.size.width, height: pieView.frame.size.width)
        pieChartView.center   =  CGPoint(x: view.frame.width / 2, y: 120)
        pieChartView.segments = [
            Segment(color: .red, name: "57 %",  value: 57),
            Segment(color: .blue, name : "37 %",  value: 30),
        ]
        self.view.addSubview(pieChartView)
    }
   
    func setData(){
        
        self.investAmount.text   =    "₹ \(self.convertValue(amount: self.summaryData["initialval"] as? String ?? "0"))"
        self.worthAmount.text    =    "₹ \(self.convertValue(amount: self.summaryData["currentval"] as? String ?? "0"))"
        self.gainAmount.text     =    "₹ \(self.convertValue(amount: self.summaryData["gain"] as? String ?? "0"))"
        self.cagrAmount.text     =    "\(self.convertValue(amount: self.summaryData["CAGR"] as? String ?? "0")) %"
    }

    func convertValue(amount : String)-> Double{
        let amountFloat : Float? = Float(amount)
        let amountInt : Int?  =  Int(amountFloat!)
        return Double(amountInt!)
    }
    
    @IBAction func fullViewBtn(_ sender: Any) {
        let  vc    =   self.storyboard?.instantiateViewController(withIdentifier: "FullViewFirstVC") as! FullViewFirstVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    
    func callGetSummaryApi(urlStr : String,apiName : String){
        FinCartMacros.showSVProgressHUD()
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.getQuickSipData(accessToken!,urlStr : urlStr, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        if let json = try? JSONSerialization.jsonObject(with: (data as! Data), options: JSONSerialization.ReadingOptions.allowFragments) as Any? {
                            if let jsonDict = json as? [[String: Any]] {
                                self.summaryData   =   jsonDict[0] 
                                    print(self.summaryData)
                                    self.setData()
                            }else{
                                self.popUpView.isHidden  =  false
                            }
                        }
                        else{
                            self.popUpView.isHidden  =  false
                            //SSCommonClass.ToastShowMessage(msg: "SERVER SIDE ERROR!",viewController: nil)
                            print("SERVER SIDE ERROR!")
                        }
                    })
                }
                else if (httpResponse.statusCode == 401){
                    print("ahjdsgfge")
//                    SVProgressHUD.dismiss()
//                    self.alertController("Server Error", message: "Server is temporary not available")
                    self.refreshAccessToken()
                }else{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.alertController("Server Error", message: "Server is temporary not available")
                    })
                }
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    
    private func refreshAccessToken()
    {
        FincartCommon.refreshAccessToken(success: { (responseCode) in
            if responseCode != 200{
                self.getAccessToken()
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func getAccessToken()
    {
        FincartCommon.getAccessToken(success: { (responseCode) in
            if responseCode != 200{
                DispatchQueue.main.async(execute: {
                    SVProgressHUD.dismiss()
                    let alert = UIAlertController(title: "Session Expired", message: "Please login again. ", preferredStyle: UIAlertControllerStyle.alert)
                    let alertAction = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.cancel) { (alertAction) in
                        alert.dismiss(animated: true)
                        FinCartUserDefaults.sharedInstance.saveAccessToken(nil)
                        FinCartUserDefaults.sharedInstance.saveRefershToken(nil)
                        FinCartUserDefaults.sharedInstance.saveTokenType(nil)
                        self.appDelegate.showLoginScreen()
                    }
                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                })

            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    
    private func alertController(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (alertAction) in
            alert.dismiss(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
}
