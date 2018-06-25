//
//  KYCInvestorTypeVC.swift
//  Fincart
//
//  Created by Ankit Bisht on 1/30/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class KYCInvestorTypeVC: UITableViewController {
    
    var investorTypeArray=NSArray()
    var colors=Colors()
    var dimensions=Dimensions()
    var images=Images()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNav()

        investorTypeArray=["INDIVIDUAL","ON BEHALF OF MINOR","HINDU UNDIVIDED FAMILY (HUF)","NON-RESIDENT INDIAN (NRI)"]
       
    }
    func addNav()
    {   
        self.navigationController?.navigationBar.isHidden=false
        self.navigationController?.navigationBar.isTranslucent=false
        self.navigationItem.title=""
        self.navigationController?.navigationBar.barTintColor=colors.APP_THEME_COLOR
        self.navigationController?.navigationBar.layer.shadowColor=UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity=0.5
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
        self.navigationController?.navigationBar.layer.masksToBounds=false
    self.navigationController?.navigationBar.titleTextAttributes=[NSAttributedStringKey.foregroundColor:colors.NAV_TITLE_COLOR]
        let back_btn=UIButton(frame:CGRect(x:0,y:0,width:20,height:20))
        back_btn.setImage(images.backBtn, for: UIControlState.normal)
        back_btn.addTarget(self, action: #selector(KYCInvestorTypeVC.backAction(_:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: back_btn)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func backAction(_ sender:UIButton){
        _ = self.navigationController?.popViewController(animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return investorTypeArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        tableView.separatorColor = UIColor.clear

        let investorType=UILabel(frame:CGRect(x:10,y:20,width:dimensions.SCREEN_WIDTH-20,height:20))
        investorType.text=investorTypeArray.object(at: indexPath.row) as? String
        investorType.font=UIFont.systemFont(ofSize: 14)
        
        let line=UIView(frame:CGRect(x:0,y:cell.frame.size.height-1,width:dimensions.SCREEN_WIDTH,height:0.6))
        line.backgroundColor=UIColor.lightGray
        
        cell.contentView.addSubview(investorType)
        cell.contentView.addSubview(line)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let investorUserDefaults=UserDefaults.standard
        investorUserDefaults.set((investorTypeArray.object(at: indexPath.row) as? String)!, forKey: "investorType")
        investorUserDefaults.synchronize()
        _ = self.navigationController?.popViewController(animated: true)
        
    }
}
