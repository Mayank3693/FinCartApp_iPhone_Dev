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
    var goalId     =   Int()
    var selectGoal =   Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goalView.isHidden  = true
        self.emptyView.isHidden  = true
        setUpBackButton()
        callGetSipApi(urlStr : FinCartMacros.kGoalAllList,apiName : "GetSip")
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = sipListTableView.dequeueReusableCell(withIdentifier: "cell") as! GoalCell
            //cell.delegate  =   self
            cell.tag       =   indexPath.row
            cell.cellHeader.text = "Other Achieved: 0%"
            if let achives = goalArr[indexPath.row]["GoalAchieved"] as? String{
                cell.cellHeader.text = String(format: "Other Achieved: %@%", achives)
            }
            cell.currentLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["CurrentAmount"] as! String)
            cell.investLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["InvestedAmount"] as! String)
            cell.pendingLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["PendingAmount"] as! String)
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
                    if apiName == "MapList"{
                        self.goalView.isHidden   =  false
                        self.emptyView.isHidden   =  false
                    }
                    // self.refreshAccessToken("save")
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

