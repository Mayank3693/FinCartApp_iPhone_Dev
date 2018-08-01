//
//  TransactVC.swift
//  Fincart
//
//  Created by Pankaj Raghav on 23/07/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class TransactVC: FinCartViewController {
    @IBOutlet var transactBtnHeight: NSLayoutConstraint!
    @IBOutlet var transactMainViewHeight: NSLayoutConstraint!
    @IBOutlet var transBtn: UIButton!
    @IBOutlet var notSatisfiedMainView: UIView!
    @IBOutlet var proceedMainView: UIView!
    
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
    
    @IBOutlet var proceedBtn: UIButton!
    
    
    var sipObjData   =   [String : Any]()
    var sipArrObj    =   [String : Any]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         proceedBtn.layer.cornerRadius = 15.0
        notSatisfiedMainView.layer.cornerRadius = 5.0
        notSatisfiedMainView.dropShadow()
        //proceedMainView.isHidden = true
        print(sipObjData)
        print(sipArrObj)
        setUpBackButton()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.setData()
    }
    
    func setData(){
        self.getAfterFifteenLabel.text   =  "After \(self.sipObjData["Duration"] as? String ?? "") years you will get"
        self.getAfterRs.text             =  self.sipObjData["Amount"] as? String ?? ""
        self.headerLabel.text            =  self.sipArrObj["SchName"] as? String ?? ""
        self.returnPercen.text            =   "\(self.convertValue(amount: self.sipArrObj["ReturnYear1"] as? String ?? "0")) %"
    }
    
    func convertValue(amount : String)-> Int{
        let amountFloat : Float? = Float(amount)
        let amountInt : Int?  =  Int(amountFloat!)
        return amountInt ?? 0
    }
    
    override func setUpBackButton(){
              let  imageName = "back_arrow";
             let   selector = #selector(back(_:))
        
            let leftBarButtonItem: UIBarButtonItem! = UIBarButtonItem.init(image: UIImage(named: imageName), style: UIBarButtonItemStyle.plain, target: self, action: selector)
            self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    }
    
    @objc func back(_ barButtonItem: UIBarButtonItem) {
        if(!proceedMainView.isHidden){
            
            transactMainViewHeight.constant = 220.0
            //transactBtnHeight.constant = 40.0
            //transBtn.isHidden = false
            proceedMainView.isHidden = true
            
        }
        else{
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
 
//    @IBAction func transBtnAction(_ sender: Any) {
//        transactMainViewHeight.constant = 180.0
//        transactBtnHeight.constant = 0.0
//        transBtn.isHidden = true
//        proceedMainView.isHidden = false
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension UIView {
    
    func dropShadow(scale: Bool = true) {
   
       layer.shadowColor = UIColor.gray.cgColor
       layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize.zero
       layer.shadowRadius = 6
    }
    
   
}
