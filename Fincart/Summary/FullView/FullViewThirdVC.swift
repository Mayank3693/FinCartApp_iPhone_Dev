//
//  FullViewThirdVC.swift
//  Fincart
//
//  Created by mayank on 23/07/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class FullViewThirdVC: FinCartViewController {
    @IBOutlet weak var pieView: UIView!

    @IBOutlet weak var eq_invested: UILabel!
    @IBOutlet weak var eq_market: UILabel!
    @IBOutlet weak var eq_allocation: UILabel!
    @IBOutlet weak var equityView: UIView!
    @IBOutlet weak var debtView: UIView!
    @IBOutlet weak var de_invested: UILabel!
    @IBOutlet weak var de_market: UILabel!
    @IBOutlet weak var de_allocation: UILabel!
    
    var allocationArray = [[String : Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        self.setOpacity(view: self.equityView)
        self.setOpacity(view: self.debtView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        setUpBackButton()
        //        setupOpaqueNavigationBar()
        self.setUpPieChart()
        self.callGetSummaryApi(urlStr: FinCartMacros.kMapAllocationList, apiName: "")
    }

    func setUpPieChart(){
        let pieChartView = PieChartView()
        pieChartView.layer.layoutIfNeeded()
        pieChartView.frame = CGRect(x: 90, y: 60, width: pieView.frame.size.width, height: pieView.frame.size.width)
        pieChartView.center   =  CGPoint(x: view.frame.width / 2, y: 120)
        pieChartView.segments = [
            Segment(color: .red, name: "23 %",  value: 23),
            Segment(color: .blue, name : "77 %",  value: 77),
        ]
        self.view.addSubview(pieChartView)
    }
    
    func setData(){
        self.eq_invested.text      =    "₹ \(self.allocationArray[0]["EquityIA"] as? String ?? "0")"
        self.eq_market.text        =    "₹ \(self.allocationArray[0]["EquityMV"] as? String ?? "0")"
        self.eq_allocation.text    =    "23 %"
        self.de_invested.text      =    "₹ \(self.allocationArray[0]["debtIA"] as? String ?? "0") %"
        self.de_market.text        =    "₹ \(self.allocationArray[0]["DebtMV"] as? String ?? "0")"
        self.de_allocation.text    =    "77 %"
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
                                self.allocationArray    = json as! [[String : Any]]
                                //                                self.summaryData   =   jsonDict[0]
                                //                                print(self.summaryData)
                                self.setData()
                            }else{
                                //self.popUpView.isHidden  =  false
                            }
                        }
                        else{
                            //self.popUpView.isHidden  =  false
                            //SSCommonClass.ToastShowMessage(msg: "SERVER SIDE ERROR!",viewController: nil)
                            print("SERVER SIDE ERROR!")
                        }
                    })
                }
                else if (httpResponse.statusCode == 401){
                    print("ahjdsgfge")
                    //self.refreshAccessToken()
                }else{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        //self.alertController("Server Error", message: "Server is temporary not available")
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
    
    private func alertController(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (alertAction) in
            alert.dismiss(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }

}
