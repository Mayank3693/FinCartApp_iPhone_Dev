//
//  GoalsVC.swift
//  Fincart
//
//  Created by Kamal on 09/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

class FinCartGoalsVC: FinCartViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate{
    
    var goalsFetchedArray: [String]?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let kColorGreen : UIColor = UIColor(displayP3Red: 177/255, green: 226/255, blue: 89/255, alpha: 1)
    let kColorBlue : UIColor = UIColor(displayP3Red: 120/255, green: 201/255, blue: 248/255, alpha: 1)
    let kColorOrange : UIColor = UIColor(displayP3Red: 250/255, green: 166/255, blue: 56/255, alpha: 1)
    let kColorDarkOrange : UIColor = UIColor(displayP3Red: 242/255, green: 108/255, blue: 75/255, alpha: 1)
    let kColorRed : UIColor = UIColor(displayP3Red: 232/255, green: 56/255, blue: 64/255, alpha: 1)
    let kColorDarkBlue : UIColor = UIColor(displayP3Red: 72/255, green: 186/255, blue: 252/255, alpha: 1)
    let kColorPink : UIColor = UIColor(displayP3Red: 230/255, green: 0/255, blue: 122/255, alpha: 1)
    @IBOutlet weak var goalsCollectionView: UICollectionView!
    var imagesName : [String] = ["plan_for_children", "turn_your_money", "retirement", "child_wedding", "your_wedding", "car", "bike", "travel", "home", "child_education", "start_up", "further_studies", "sabbatical", "other_goals"]
    var goalsCode : [String] = ["FG11", "FG8", "FG9", "FG13", "FG7", "FG3", "FG1", "FG6", "FG4", "FG12", "FG2", "FG5", "FG10", "FG14"]
    var savedUserGoalServiceResponse: SavedUserGoalServiceResponse?
    var userGoalStatusServiceResponse: UserGoalStatusServiceResponse?
    var imagesBackgoundColor : [UIColor]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self;
        goalsFetchedArray = [String]()
        goalsCollectionView.delegate = self
        goalsCollectionView.dataSource = self
        mapFetchedUserSavedGoalsCode()
        imagesBackgoundColor = [kColorGreen, kColorBlue, kColorOrange, kColorDarkOrange, kColorRed, kColorDarkBlue, kColorGreen, kColorBlue, kColorDarkOrange, kColorPink, kColorGreen, kColorRed, kColorOrange, kColorDarkBlue]
        setUpBackButton()
        setupOpaqueNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FinCartMacros.showSVProgressHUD()
        getUserGoalStatus()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = goalsCollectionView.dequeueReusableCell(withReuseIdentifier: "fincartGoalsCell", for: indexPath) as! FinCartGoalsCollectionViewCell
        cell.parentView.backgroundColor = imagesBackgoundColor[indexPath.row]
        cell.cellDisplayContent(imagesName[indexPath.row])
        if !((goalsFetchedArray?.contains(goalsCode[indexPath.row]))!){
            cell.pencilImage.isHidden = true
        }else{
            cell.pencilImage.isHidden = false
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let windowHeight = UIScreen.main.bounds.size.height
        let windowWidth = UIScreen.main.bounds.size.width
        var cellWidth: CGFloat!
        if indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 9{
            cellWidth = (windowWidth - 46)/3
        }
        else{
            cellWidth = (windowWidth - 26)/2
        }
        let cellHeight = (windowHeight - 86)/5
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if goalsCode[indexPath.row].caseInsensitiveCompare(FincartCommon.CHILD_EDU_GOAL) == ComparisonResult.orderedSame
        || goalsCode[indexPath.row].caseInsensitiveCompare(FincartCommon.CHILD_WEDS_GOAL) == ComparisonResult.orderedSame
        {
            let userInfoVC : FinCartUserInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fincartUserInfoVC") as! FinCartUserInfoVC;
            userInfoVC.isSingleGoalChild = true
            userInfoVC.isSingleGoal = true
            userInfoVC.singleGoalCode = goalsCode[indexPath.row]
            self.navigationController?.pushViewController(userInfoVC, animated: true)
        }else if ((goalsFetchedArray?.contains(goalsCode[indexPath.row]))!){
            let editGoalVC : EditGoalsDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "editGoalsDetailsVC") as! EditGoalsDetailsVC;
            editGoalVC.userGoalStatusServiceResponseElement = getClickedGoalsDetails(indexPath)
            self.navigationController?.pushViewController(editGoalVC, animated: true)
        }else{
            let userInfoVC : FinCartUserInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fincartUserInfoVC") as! FinCartUserInfoVC;
            if indexPath.row == 3 || indexPath.row == 9{
                userInfoVC.isSingleGoalChild = true
            }
            else{
                userInfoVC.isSingleGoalChild = false
            }
            userInfoVC.isSingleGoal = true
            userInfoVC.singleGoalCode = goalsCode[indexPath.row]
            self.navigationController?.pushViewController(userInfoVC, animated: true)
        }
    }
    
    private func mapFetchedUserSavedGoalsCode(){
        for index in 0 ..< (self.savedUserGoalServiceResponse?.count)!{
            self.goalsFetchedArray?.append((self.savedUserGoalServiceResponse?[index].goalCode)!)
        }
    }
    
    private func getUserGoalStatus()
    {
        let access_token = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.getUserGoalStatus(access_token!, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200 && data != nil{ 
                    do{
                        self.userGoalStatusServiceResponse = try UserGoalStatusServiceResponse(data: data as! Data)
                    }catch{}
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        self.goalsCollectionView.reloadData()
                    })
                }
                else if httpResponse.statusCode == 401{
                    self.refreshAccessToken("getUserGoalStatus")
                }
            }else{
                DispatchQueue.main.async(execute: {
                    SVProgressHUD.dismiss()
                    self.alertController("Server Error", message: "Server is not responding")
                })
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func refreshAccessToken(_ type: String)
    {
        FincartCommon.refreshAccessToken(success: { (responseCode) in
            if responseCode == 200{
                self.getUserGoalStatus()
            }else{
                self.getAccessToken(type)
            }
        }) { (error) in
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                self.alertController("Error", message: error.localizedDescription)
            })
        }
    }
    
    private func getAccessToken(_ type: String)
    {
        FincartCommon.getAccessToken(success: { (responseCode) in
            if responseCode == 200{
                self.getUserGoalStatus()
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
    
    private func alertController(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel) { (alertAction) in
            alert.dismiss(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    private func getClickedGoalsDetails(_ indexPath: IndexPath) -> UserGoalStatusServiceResponseElement{
        for index in 0 ..< (userGoalStatusServiceResponse?.count)!{
            if userGoalStatusServiceResponse?[index].goalCode?.caseInsensitiveCompare(goalsCode[indexPath.row]) == ComparisonResult.orderedSame{
                return (userGoalStatusServiceResponse?[index])!
            }
        }
        return (userGoalStatusServiceResponse?[0])!
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer {
            return false
        }
        return true
    }
}
