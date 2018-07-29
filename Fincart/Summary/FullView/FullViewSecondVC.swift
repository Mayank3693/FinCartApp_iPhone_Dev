//
//  FullViewSecondVC.swift
//  Fincart
//
//  Created by mayank on 23/07/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class FullViewSecondVC: FinCartViewController{
    @IBOutlet weak var purchaseAmnt: UILabel!
    @IBOutlet weak var purchaseView: UIView!
    @IBOutlet weak var switchInView: UIView!
    @IBOutlet weak var switchInAmnt: UILabel!
    @IBOutlet weak var switchOutView: UIView!
    @IBOutlet weak var switchOutAmnt: UILabel!
    @IBOutlet weak var sellView: UIView!
    @IBOutlet weak var sellAmnt: UILabel!
    @IBOutlet weak var divendendView: UIView!
    @IBOutlet weak var divendedAmnt: UILabel!
    @IBOutlet weak var anualView: UIView!
    @IBOutlet weak var anualAmnt: UILabel!
    
    var oneViewData  =  [[String : Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        setUpBackButton()
        //        setupOpaqueNavigationBar()
        self.callGetSummaryApi(urlStr: FinCartMacros.kMapOneViewList, apiName: "")
    }
    
    override func viewDidLayoutSubviews() {
        self.setOpacity(view: self.purchaseView)
        self.setOpacity(view: self.switchInView)
        self.setOpacity(view: self.switchOutView)
        self.setOpacity(view: self.sellView)
        self.setOpacity(view: self.divendendView)
        self.setOpacity(view: self.anualView)
    }
    func setData(){
        self.purchaseAmnt.text      =    "₹ \(self.oneViewData[0]["Purchase"] as? String ?? "0")"
        self.switchInAmnt.text      =    "₹ \(self.oneViewData[0]["SwitchIn"] as? String ?? "0")"
        self.switchOutAmnt.text     =    "₹ \(self.oneViewData[0]["Switchout"] as? String ?? "0")"
        self.sellAmnt.text          =    "₹ \(self.oneViewData[0]["Sell"] as? String ?? "0") %"
        self.divendedAmnt.text      =    "₹ \(self.oneViewData[0]["DivAmt"] as? String ?? "0")"
        self.anualAmnt.text         =    "₹ \(self.oneViewData[0]["CurrentVal"] as? String ?? "0")"
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
                                self.oneViewData     =    jsonDict
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

class FullViewSecondCell: UITableViewCell {
    
    @IBOutlet weak var summaryLogo: UIImageView!
    @IBOutlet weak var summaryName: UILabel!
    @IBOutlet weak var summaryPrice: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        print("fsd")
    }
    override func layoutSubviews() {
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize(width: 0, height: 1)
        mainView.layer.shadowOpacity = 0.6
        mainView.layer.shadowRadius = 5
    }
}
