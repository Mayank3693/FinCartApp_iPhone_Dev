//
//  TransactListVC.swift
//  Fincart
//
//  Created by mayank on 30/07/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class TransactListVC: FinCartViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sipData        =  [String : Any]()
    var transactList   =  [[String : Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(self.sipData)
        let transactiontype   =  "SIP"
        let url = "/\(self.sipData["ProductList"] as! String)/\(transactiontype)"
        self.callGetTransactApi(urlStr: FinCartMacros.kTransactDataList + url, apiName: "")
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  self.tableView.frame.size.height*0.55
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story               =   UIStoryboard.init(name: "SIP", bundle: nil)
        let contentVC           =   story.instantiateViewController(withIdentifier: "TransactVC") as! TransactVC
        contentVC.sipObjData    =    self.sipData
        contentVC.sipArrObj     =    self.transactList[indexPath.row]
        self.navigationController?.pushViewController(contentVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TransactCell
        cell.selectionStyle   =  UITableViewCellSelectionStyle.none
        cell.getAfterFifteenLabel.text   =  "After \(self.sipData["Duration"] as? String ?? "") years you will get"
        cell.getAfterRs.text             =  self.sipData["Amount"] as? String ?? ""
        cell.headerLabel.text            =  self.transactList[indexPath.row]["SchName"] as? String ?? ""
        cell.returnPercen.text            = "\(self.convertValue(amount: self.transactList[indexPath.row]["ReturnYear1"] as? String ?? "0")) %"
        //cell.riskLabel.text              =  self.
        return cell
    }
    
    func convertValue(amount : String)-> Int{
        let amountFloat : Float? = Float(amount)
        let amountInt : Int?  =  Int(amountFloat!)
        return amountInt ?? 0
    }
    
    func callGetTransactApi(urlStr : String,apiName : String){
        FinCartMacros.showSVProgressHUD()
        let accessToken = FinCartUserDefaults.sharedInstance.retrieveAccessToken()
        APIManager.sharedInstance.getQuickSipData(accessToken!,urlStr : urlStr, success: { (response, data) in
            if let httpResponse = response as? HTTPURLResponse{
                if httpResponse.statusCode == 200{
                    DispatchQueue.main.async(execute: {
                        SVProgressHUD.dismiss()
                        if let json = try? JSONSerialization.jsonObject(with: (data as! Data), options: JSONSerialization.ReadingOptions.allowFragments) as Any? {
                            if let jsonDict = json as? [[String: Any]] {
                                    self.transactList  =  jsonDict
                                    print(self.transactList)
                                    self.tableView.reloadData()
                                    print(self.transactList)
                                }
                            } else {
                                print("Error in parsing")
                            }
                        
                    })
                }
                else if (httpResponse.statusCode == 401){
                    print("ahjdsgfge")
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
    
}

class TransactCell: UITableViewCell {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var getAfterFifteenImg: UIImageView!
    @IBOutlet weak var getAfterFifteenLabel: UILabel!
    @IBOutlet weak var getAfterRs: UILabel!
    @IBOutlet weak var returnImg: UIImageView!
    @IBOutlet weak var returnLabel: UILabel!
    @IBOutlet weak var returnPercen: UILabel!
    @IBOutlet weak var riskImg: UIImageView!
    @IBOutlet weak var riskLabel: UILabel!
    @IBOutlet weak var riskPrice: UILabel!
    
    
    override func awakeFromNib() {
        print("abcd")
    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        if selected == true{
//            self.selectImage.image   =  UIImage.init(named: "select")
//        }else{
//            self.selectImage.image   =  UIImage.init(named: "dot")
//        }
//    }
}
