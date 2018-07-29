//
//  SipListVC.swift
//  Fincart
//
//  Created by Pankaj Raghav on 27/06/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class SipListVC: FinCartViewController,UITableViewDelegate,UITableViewDataSource,SipListDelegate {

    @IBOutlet weak var sipListTableView: UITableView!
    @IBOutlet weak var mapTableView: UITableView!
    @IBOutlet weak var goalView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var createGoal: UIButton!
    @IBOutlet weak var mapGoalBtn: UIButton!
    let COMPLETE_PROFILE_TAG = 1
    let ACTIVATE_SIP_TAG = 2
    
    var userserviceResponse  :  UserGoalStatusServiceResponse!
    var goalArr    =   [[String:Any]]()
    var mapArray   =   [[String : Any]]()
    var goalId     =   Int()
    var selectGoal =   Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goalView.isHidden  = true
        self.emptyView.isHidden  = true
        setUpBackButton()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        callGetSipApi(urlStr : FinCartMacros.kFetchSipList,apiName : "GetSip")
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
        if tableView == self.mapTableView {
            return mapArray.count
        }else{
            return goalArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.mapTableView {
            let cell = mapTableView.dequeueReusableCell(withIdentifier: "MapCell") as! MapCell
            return cell
        }else{
            
//            FinCartUserDefaults.sharedInstance.saveKycStatus((self.userDetailsServiceResponse?.cafDetails!["kycStatus"])!)
           let cell = sipListTableView.dequeueReusableCell(withIdentifier: "SipListCell") as! SipListCell
            cell.delegate  =   self
            cell.tag       =   indexPath.row
            cell.cellHeader.text = "Other Achieved: 0%"
            if let achives = goalArr[indexPath.row]["GoalAchieved"] as? String{
                cell.cellHeader.text = String(format: "Other Achieved: %@%", achives)
            }
            cell.currentLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["CurrentAmount"] as! String)
            cell.investLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["InvestedAmount"] as! String)
            cell.pendingLabel.text = String(format: "₹ %@", goalArr[indexPath.row]["PendingAmount"] as! String)
              let kycStatus = FinCartUserDefaults.sharedInstance.retrieveKycStatus()
            
            cell.activateBtn.tag = indexPath.row
            
            if(kycStatus == "Y"){
                
                cell.activateBtn.addTarget(self, action: #selector(activateSipAction), for: .touchUpInside)
                
                cell.activateBtn.setTitle("ACTIVATE", for: UIControlState.normal)
                
            }
            else{
                 cell.activateBtn.addTarget(self, action: #selector(completeProfileAction), for: .touchUpInside)
                cell.activateBtn.setTitle("COMPLETE PROFILE", for: UIControlState.normal)
                
            }
            
            
            
//            saveKycStatus((self.userDetailsServiceResponse?.cafDetails!["kycStatus"])!)
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.mapTableView {
            self.selectGoal  =  indexPath.row
        }
    }
    func mapWithGoal(index: Int) {
        self.callGetSipApi(urlStr: FinCartMacros.kMapDataList, apiName: "MapList")
        self.goalId  =   self.goalArr[index]["ID"] as! Int
        self.goalView.isHidden  = true
    }
    @IBAction func mapGoalAct(_ sender: Any) {
        self.callGetSipApi(urlStr: FinCartMacros.kMapDataList, apiName: "MapGoal")
    }
    
    @IBAction func cancelBtnAct(_ sender: Any) {
        self.goalView.isHidden   =  true
    }
    
    @objc func activateSipAction() {
        
        let contentVC=self.storyboard?.instantiateViewController(withIdentifier: "TransactListVC") as! TransactListVC
        self.navigationController?.pushViewController(contentVC, animated: true)
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
                            if let jsonDict = json as? [String: Any] {
                                if apiName == "GetSip"{
                                    self.goalArr = jsonDict["UserGoal"] as! [[String:Any]]
                                    self.sipListTableView.reloadData()
                                    print(self.goalArr)
                                }else{
                                    self.emptyView.isHidden   =  true
                                    self.goalView.isHidden    =  false
                                    self.mapGoalBtn.isHidden  =  false
                                    self.mapArray   =  jsonDict["UserGoal"] as! [[String:Any]]
                                    self.mapTableView.reloadData()
                                    print(self.mapArray)
                                }
                            } else {
                                if apiName == "MapList"{
                                    self.goalView.isHidden    =  false
                                    self.emptyView.isHidden   =  false
                                    self.mapGoalBtn.isHidden  =  true
                                    self.mapTableView.reloadData()
                                }
                                print("Error in parsing")
                            }
                        }
                        else{
                            if apiName == "MapList"{
                                self.goalView.isHidden   =  false
                                self.emptyView.isHidden   =  false
                                self.mapTableView.reloadData()
                            }
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
                        self.mapTableView.reloadData()
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol SipListDelegate {
    func mapWithGoal(index :Int)
//    func modify(index :Int)
//    func Activte(index :Int)
}
class SipListCell: UITableViewCell {
    var delegate  :  SipListDelegate?
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
    @IBAction func modifyBtn(_ sender: Any) {
       // self.delegate?.modify(index: self.tag)
    }
    @IBAction func activateBtn(_ sender: Any) {
       // self.delegate?.Activte(index: self.tag)
    }
    @IBAction func mapBtn(_ sender: Any) {
        self.delegate?.mapWithGoal(index: self.tag)
    }
    
    
}

class MapCell: UITableViewCell {

    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var goalLabel: UILabel!
    
    override func awakeFromNib() {
        print("abcd")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true{
            self.selectImage.image   =  UIImage.init(named: "select")
        }else{
            self.selectImage.image   =  UIImage.init(named: "dot")
        }
        
        // Configure the view for the selected state
    }
}

