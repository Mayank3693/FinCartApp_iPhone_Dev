//
//  FinCartDashboardVC.swift
//  Fincart
//
//  Created by Kamal on 02/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation
import UIKit

class FinCartDashboardVC: FinCartViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var financialPlanningTable: UITableView!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    var type:String?
    var savedUserGoalServiceResponse: SavedUserGoalServiceResponse?
    
    var titlesArray : [String] = ["FULL FINANCIAL PLANNING", "GOALS", "TAX SAVING INSURANCE", "TURN YOUR MONEY INTO MORE MONEY"]
    var descriptionArray : [String] = ["FULL FINANCIAL PLANNING", "FULL FINANCIAL PLANNING", "FULL FINANCIAL PLANNING", "FULL FINANCIAL PLANNING"]
    var descImageArray : [String] = ["full_finanicial", "goals", "tax_saving", "tax_saving"];
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        self.financialPlanningTable.delegate = self
        self.financialPlanningTable.dataSource = self
        self.financialPlanningTable.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpBackButton()
        setupOpaqueNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //adjustHeightOfTableView()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titlesArray.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = financialPlanningTable.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! FinancialPlanningCell
        //cell.cellImage.image = UIImage.animatedImageNamed("fb-icon.png", duration: 0)
        let titleText = titlesArray[indexPath.section]
        let descTitle = descriptionArray[indexPath.section]
        let image = UIImage(named: descImageArray[indexPath.section])
        cell.cellTitle.text = titleText
        cell.cellDescription.text = descTitle
        cell.cellImage.image = image
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        cell.contentView.layer.borderWidth = 2;
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.cornerRadius = 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            // hide the header
            return CGFloat.leastNonzeroMagnitude
        default:
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            // hide the header
            return nil
        default:
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 3:
            // hide the header
            return 80
        default:
            return 60
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            type = "Full Finacial"
            resetTaggedQuestions()
            break;
        case 1:
            type = "Single Goal"
            resetTaggedQuestions()
            break;
        case 2:
            let userInfoVC : FinCartUserInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fincartUserInfoVC") as! FinCartUserInfoVC;
            self.navigationController?.pushViewController(userInfoVC, animated: true)
        case 3:
            let userInfoVC : FinCartUserInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fincartUserInfoVC") as! FinCartUserInfoVC;
            self.navigationController?.pushViewController(userInfoVC, animated: true)
        default: break
        }
    }
    
    //private methods
    private func adjustHeightOfTableView(){
        var height = self.financialPlanningTable.contentSize.height
        let maxHeight = (self.financialPlanningTable.superview?.frame.height)! - self.financialPlanningTable.frame.origin.y
        
        if height > maxHeight {
            height = maxHeight
        }
        
        UIView.animate(withDuration: 0) {
            self.tableHeightConstraint.constant = height
            self.view.needsUpdateConstraints()
        }
        
        let tablecontentSize = self.financialPlanningTable.contentSize.height
        if tablecontentSize < maxHeight {
            self.financialPlanningTable.isScrollEnabled = false
        }
        else{
            self.financialPlanningTable.isScrollEnabled = true
        }
    }
    
    private func resetTaggedQuestions()
    {
        FinCartMacros.showSVProgressHUD()
        let access_token = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.resetTaggedQuestions(access_token!, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    if self.type?.caseInsensitiveCompare("Single Goal") == ComparisonResult.orderedSame{
                        self.fetchSavedUserGoalsCode()
                    }else{
                        DispatchQueue.main.async(execute: {
                            SVProgressHUD.dismiss()
                            let userInfoVC : FinCartUserInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fincartUserInfoVC") as! FinCartUserInfoVC;
                            userInfoVC.singleGoalCode = ""
                            self.navigationController?.pushViewController(userInfoVC, animated: true)
                        })
                    }
                }
                else if (httpResponse.statusCode == 401){
                    self.refreshAccessToken()
                }
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func fetchSavedUserGoalsCode(){
        let access_token = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.fetchSavedUserGoalsCode(access_token!, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 && data != nil {
                    do{
                        self.savedUserGoalServiceResponse = try SavedUserGoalServiceResponse(data: data as! Data)
                        DispatchQueue.main.async(execute: {
                            SVProgressHUD.dismiss()
                        let goalsVC : FinCartGoalsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fincartGoalsVC") as! FinCartGoalsVC;
                        goalsVC.savedUserGoalServiceResponse = self.savedUserGoalServiceResponse
                        self.navigationController?.pushViewController(goalsVC, animated: true)
                        })
                    }catch{
                    }
                }
                else if (httpResponse.statusCode == 401){
                    self.refreshAccessToken()
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
            if responseCode == 200{
                self.resetTaggedQuestions()
            }else{
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
            if responseCode == 200{
                self.resetTaggedQuestions()
            }else{
                DispatchQueue.main.async(execute: {
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
    
    private func setNavigationTitle(){
        let image = UIImage(named: "logo.png")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
    private func alertController(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (alertAction) in
            alert.dismiss(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer {
            return false
        }
        return true
    }
}
