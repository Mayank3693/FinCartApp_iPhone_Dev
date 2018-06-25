//
//  OccupationsList
//  Fincart
//
//  Created by Ankit Bisht on 1/30/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class IDCardsLists: UITableViewController {
    
    var idCardsArray=NSArray()
    var colors=Colors()
    var dimensions=Dimensions()
    var images=Images()
    var controllerFlag=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNav()
        
        idCardsArray=["Company Identification Number","Driving License","Election ID Card","Global Entity Identification Number","ID Card","Not categorized","NREGA Job Card","Others","PAN Card","Passport","TIN(Tax Payer Identification Number)","UIDIA/Aadhar letter","US GIIN"]
        
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
        back_btn.addTarget(self, action: #selector(IDCardsLists.backAction(_:)), for: UIControlEvents.touchUpInside)
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
        return idCardsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        tableView.separatorColor = UIColor.clear
        
        let idCards=UILabel(frame:CGRect(x:10,y:20,width:dimensions.SCREEN_WIDTH-20,height:20))
        idCards.text=idCardsArray.object(at: indexPath.row) as? String
        idCards.font=UIFont.systemFont(ofSize: 14)
        
        let line=UIView(frame:CGRect(x:0,y:cell.frame.size.height-1,width:dimensions.SCREEN_WIDTH,height:0.6))
        line.backgroundColor=UIColor.lightGray
        
        cell.contentView.addSubview(idCards)
        cell.contentView.addSubview(line)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let idCardsUserDefaults=UserDefaults.standard
        idCardsUserDefaults.set((idCardsArray.object(at: indexPath.row) as? String)!, forKey: "idCards")
        idCardsUserDefaults.synchronize()
        
        let controllerFlagDefaults=UserDefaults.standard
        if controllerFlag == 1{
            controllerFlagDefaults.set("1", forKey: "controllerFlag")
        }
        else if controllerFlag == 2{
            controllerFlagDefaults.set("2", forKey: "controllerFlag")
        }
        else {
            controllerFlagDefaults.set("3", forKey: "controllerFlag")
        }
        controllerFlagDefaults.synchronize()
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
}


