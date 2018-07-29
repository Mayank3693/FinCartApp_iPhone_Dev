//
//  FullViewFirstVC.swift
//  Fincart
//
//  Created by mayank on 23/07/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import CarbonKit

class FullViewFirstVC: FinCartViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var expandData       =   [[String : Any]]()
    var portfolioArray   =   [[String : Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.expandData.append(["isOpen":"1","data":["banana","mango"],])
        self.expandData.append(["isOpen":"1","data":["banana","mango","apple"]])
        //self.expandData.append(["isOpen":"1","data":["banana"]])
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
  
    override func viewWillAppear(_ animated: Bool) {
//        setUpBackButton()
//        setupOpaqueNavigationBar()
        self.callGetSummaryApi(urlStr: FinCartMacros.kMapPortfolioList, apiName: "")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return expandData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataDic     =     self.expandData[section]  as? [String : Any] {
            let isOpen      =     dataDic["isOpen"] as? String
            if isOpen == "1"{
                return 0
            }else{
                let dataarray = dataDic["data"] as? NSArray//self.expandData[section].value(forKey: "data") as! NSArray
                return dataarray!.count
            }
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell: HeaderDetailCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? HeaderDetailCell
        if cell == nil {
            tableView.register(UINib(nibName: "HeaderDetailCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? HeaderDetailCell
        }
        var dataDic = self.expandData[indexPath.section]  as? [String : Any]
        let dataarray = dataDic!["data"] as! NSArray
        cell.invested.text = "₹ \(self.convertValue(amount: self.portfolioArray[indexPath.row]["initialval"] as? String ?? "0"))"
        cell.worth.text = "₹ \(self.convertValue(amount: self.portfolioArray[indexPath.row]["currentval"] as? String ?? "0"))"
        cell.gain.text = "₹ \(self.convertValue(amount: self.portfolioArray[indexPath.row]["gain"] as? String ?? "0"))"
        cell.cagr.text = "₹ \(self.convertValue(amount: self.portfolioArray[indexPath.row]["CAGR"] as? String ?? "0"))"
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        headerView.backgroundColor = UIColor.white
        let image = UIImageView(frame: CGRect(x: 5, y: 8, width: 22 , height: 22))
        if let dataDic     =     self.expandData[section]  as? [String : Any] {
            let isOpen      =     dataDic["isOpen"] as? String
            if isOpen == "1"{
                image.image  =  UIImage.init(named: "plus")
            }else{
                image.image  =  UIImage.init(named: "minus")
            }
        }
        let label = UILabel(frame: CGRect(x: 38, y: 5, width: headerView.frame.size.width - 5, height: 27))
        if self.portfolioArray.count == 0 {
            label.text = ""
        }else{
           label.text = "\(self.portfolioArray[section]["ApplicantName"] as? String ?? "")"
        }
        headerView.addSubview(image)
        headerView.addSubview(label)
        headerView.tag = section + 100
        
        let tapgesture = UITapGestureRecognizer(target: self , action: #selector(self.sectionTapped(_:)))
        headerView.addGestureRecognizer(tapgesture)
        return headerView
    }
    
    @objc func sectionTapped(_ sender: UITapGestureRecognizer){
            var dataDic   =   self.expandData[(sender.view?.tag)! - 100]  as? [String : Any]
            let isOpen      =     dataDic!["isOpen"] as? String
            if isOpen == "1"{
                dataDic!["isOpen"]  =  "0"
            }else{
                dataDic!["isOpen"]  =  "1"
            }
        self.expandData[(sender.view?.tag)! - 100]   =  dataDic!
        self.tableView.reloadData()
    }
    
    func convertValue(amount : String)-> Double{
        let amountFloat : Float? = Float(amount)
        let amountInt : Int?  =  Int(amountFloat!)
        return Double(amountInt!)
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
                                self.portfolioArray  =  jsonDict
                                print(self.portfolioArray)
                                self.tableView.reloadData()
//                                self.summaryData   =   jsonDict[0]
//                                print(self.summaryData)
//                                self.setData()
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
