//
//  SipListVC.swift
//  Fincart
//
//  Created by Pankaj Raghav on 27/06/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class SipListVC: FinCartViewController,UITableViewDelegate,UITableViewDataSource {
var userserviceResponse  :  UserGoalStatusServiceResponse!
    var goalArr = [[String:Any]]()
    @IBOutlet weak var sipListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackButton()
       callGetSipApi()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Table view Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sipListTableView.dequeueReusableCell(withIdentifier: "SipListCell") as! SipListCell
//        "InvestedAmount": "0",
//        "CurrentAmount": "0",
//        "PendingAmount": "822240"
        
        cell.cellHeader.text = "Other Achieved: 0%"
        if let achives = goalArr[indexPath.row]["GoalAchieved"] as? String{
            cell.cellHeader.text = String(format: "Other Achieved: %@%", achives)
        }
        


        cell.currentLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["CurrentAmount"] as! String)
        
        cell.investLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["InvestedAmount"] as! String)
        cell.pendingLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["PendingAmount"] as! String)
        
        return cell
    }
    
    
    // Pankaj Comitted
    
    func callGetSipApi(){
        FinCartMacros.showSVProgressHUD()
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.getQuickSipData(accessToken!,urlStr : FinCartMacros.kFetchSipList, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        
                        
                        
                        
                        if let json = try? JSONSerialization.jsonObject(with: (data as! Data), options: JSONSerialization.ReadingOptions.allowFragments) as Any? {
                            
                            if let jsonDict = json as? [String: Any] {
                                
                                self.goalArr = jsonDict["UserGoal"] as! [[String:Any]]
                                self.sipListTableView.reloadData()
                                print(self.goalArr)
                            } else {
                                
                                print("Error in parsing")
                            }
                        }
                        else{
                            //SSCommonClass.ToastShowMessage(msg: "SERVER SIDE ERROR!",viewController: nil)
                            print("SERVER SIDE ERROR!")
//                            SSCommonClass.dismissProgress()
                        }
                        
                        
                        
                        
//                        if let StringResponse = String(data: data! as! Data, encoding: String.Encoding.utf8) as String? {
//                            DispatchQueue.main.async(execute: {
//                                SVProgressHUD.dismiss()
//                                print(StringResponse)
//                                do{
//                                    self.userserviceResponse  = try UserGoalStatusServiceResponse(StringResponse)
//                                   
//                                    //goalsReviewModel = try GoalsReview(jsonString)
//                                }catch{}
//                                
//                            })
//                        }
                        
                        
                        
//                        let sipList: SipListVC! = self.storyboard?.instantiateViewController(withIdentifier: "SipListVC") as! SipListVC
//                        self.navigationController?.pushViewController(sipList, animated: true)
                        //                        self.appDelegate.showDashboardScreen()
                    })
                }
                else if (httpResponse.statusCode == 401){
                    print("ahjdsgfge")
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class SipListCell: UITableViewCell {
    @IBOutlet weak var cellHeader: UILabel!
    @IBOutlet weak var investLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var pendingLabel: UILabel!
    @IBOutlet weak var modifyBtn: UIButton!
    @IBOutlet weak var activateBtn: UIButton!
    @IBOutlet weak var mapWithGoalBtn: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        activateBtn.layer.cornerRadius = 10.0
        modifyBtn.layer.cornerRadius = 10.0
        mainView.layer.cornerRadius = 10.0
        mapWithGoalBtn.layer.cornerRadius = 10.0
        
    }


    
    
    
}
