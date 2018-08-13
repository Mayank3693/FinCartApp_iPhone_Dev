//
//  GoalList.swift
//  Fincart
//
//  Created by mayank on 24/07/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class GoalList: FinCartViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var sipListTableView: UITableView!
    @IBOutlet weak var goalView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var createGoal: UIButton!
    
    var goalArr    =   [[String:Any]]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var goalId     =   Int()
    var selectGoal =   Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goalView.isHidden  = true
        self.emptyView.isHidden  = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpBackButton()
        setupOpaqueNavigationBar()
        callGetSipApi(urlStr : FinCartMacros.kUserGoalStatusURL,apiName : "GetSip")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        self.createGoal.layer.cornerRadius  = 11
    }
    //Table view Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return goalArr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.sipListTableView.frame.size.height/2 - 8
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = sipListTableView.dequeueReusableCell(withIdentifier: "cell") as! GoalCell
            //cell.delegate  =   self
            do {
               let url = URL(string: goalArr[indexPath.row]["GoalImage"] as? String ?? "")
               let data = try Data(contentsOf: url!)
               cell.mainImage.image = UIImage(data: data)
            }
            catch{
               print(error)
            }
            cell.tag       =   indexPath.row
            cell.cellHeader.text = "\(goalArr[indexPath.row]["GoalName"] as! String) Achieved: \(goalArr[indexPath.row]["GoalAchieved"] as! String)%"
            cell.desLabel.text   =  "You will get ₹ \(goalArr[indexPath.row]["GetAmount"] as! String) after completion of goal."
//            if let achives = goalArr[indexPath.row]["GoalAchieved"] as? String{
//                cell.cellHeader.text = String(format: "Other Achieved: %@%", achives)
//            }
            cell.currentLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["CurrentAmount"] as! String)
            cell.investLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["InvestedAmount"] as! String)
            cell.pendingLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["PendingAmount"] as! String)
            let kycStatus = FinCartUserDefaults.sharedInstance.retrieveKycStatus()
        if(kycStatus == "Y"){
            if let investedAmnt  =  goalArr[indexPath.row]["InvestedAmount"] as? String{
                if Int(investedAmnt) == 0{
                    cell.activateBtn.addTarget(self, action: #selector(activateSipAction(_:)) , for: .touchUpInside)
                    cell.activateBtn.setTitle("ACTIVATE", for: UIControlState.normal)
                }else{
                    cell.activateBtn.addTarget(self, action: #selector(activateSipAction(_:)) , for: .touchUpInside)
                    cell.activateBtn.setTitle("Invest Mode", for: UIControlState.normal)
                }
            }
            //cell.activateBtn.addTarget(self, action: #selector(activateSipAction(_:)), for: .touchUpInside)
            
            
        }
        else{
            cell.activateBtn.addTarget(self, action: #selector(completeProfileAction), for: .touchUpInside)
            cell.activateBtn.setTitle("COMPLETE PROFILE", for: UIControlState.normal)
            
        }
            return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if tableView == self.mapTableView {
//            self.selectGoal  =  indexPath.row
//        }
//    }
    
    @IBAction func cancelBtnAct(_ sender: Any) {
        self.goalView.isHidden   =  true
    }
    
    @objc func activateSipAction(_ sender: Any) {
        print("Commented")
       /* let story            =    UIStoryboard.init(name: "SIP", bundle: nil)
        let contentVC        =    story.instantiateViewController(withIdentifier: "TransactListVC") as! TransactListVC
        contentVC.sipData    =    self.goalArr[(sender as AnyObject).tag]
        self.navigationController?.pushViewController(contentVC, animated: true)
 */
        //        self.present(contentVC!, animated: true, completion: nil)
    }
    @objc func completeProfileAction() {
        let contentVC=self.storyboard?.instantiateViewController(withIdentifier: "FinCartKYCCheckNavigationVC")
        self.present(contentVC!, animated: true, completion: nil)
    }
    // Pankaj Comitted
    
    func callGetSipApi(urlStr : String,apiName : String){
        FinCartMacros.showSVProgressHUD()
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.getQuickSipData(accessToken!,urlStr : urlStr, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        if let json = try? JSONSerialization.jsonObject(with: (data as! Data), options: JSONSerialization.ReadingOptions.allowFragments) as Any? {
                            if let jsonDict = json as? [[String: Any]] {
                                    self.goalArr = jsonDict//jsonDict["UserGoal"] as! [[String:Any]]
                                    self.sipListTableView.reloadData()
                                    print(self.goalArr)
                            } else {
                                print("Error in parsing")
                                self.goalView.isHidden   =  false
                                self.emptyView.isHidden   =  false
                            }
                        }
                        else{
                            //SSCommonClass.ToastShowMessage(msg: "SERVER SIDE ERROR!",viewController: nil)
                            print("SERVER SIDE ERROR!")
                        }
                    })
                }
                else if (httpResponse.statusCode == 401){
                    print("ahjdsgfge")
                     self.refreshAccessToken()
                }else{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.alertController("Server Error", message: "Server is temporary available")
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
    @IBAction func saveAndTranAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func createGoalBtn(_ sender: Any) {
        let vc   =  self.storyboard?.instantiateViewController(withIdentifier: "fincartGoalsVC") as! FinCartGoalsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

