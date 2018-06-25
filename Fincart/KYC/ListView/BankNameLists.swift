//
//  OccupationsList
//  Fincart
//
//  Created by Ankit Bisht on 1/30/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class BankNameLists: UITableViewController {
    
    var bankNameArray=NSArray()
    var colors=Colors()
    var dimensions=Dimensions()
    var images=Images()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNav()
        
        bankNameArray=["Allahabad Bank","Andhra Bank","Axis Bank","Bandhan Bank Netbanking","Bank of Bahrain and Kuwait","Bank of Baroda","Bank of Baroda - Corporate Banking","Bank of Maharashtra","Canara Bank","Catholic Syrian Bank","Central Bank of India","CITI Bank","Corporation Bank","Cosmos Bank","DCB Bank","Dena Bank","Deutsche Bank","Development Credit Bank - Corporate","Dhanlaxmi Bank","Federal Bank","HDFC Bank","HSBC Bank","ICICI Bank","IDBI Bank","Indian Bank","Indian Overseas Bank","Induslnd Bank","ING Vysya Bank","Ju0026k Bank","Janata Sahakari Bank","Kalyan Janata Sahakari Bank Netbanking","Karnataka Bank","Karur Vysya Bank","Kotak Mahindra Bank","Laxmi Vilas Bank - Corporate Net Banking","Laxmi Vilas Bank - Retail Net Banking","Mehsana Urban Co-operative Bank","NKGSB Bank","Oriental Bank of Commerce","Punjab u0026 Sind Bank","Punjab National Bank","Punjab National Bank - Corporate Banking","Ratnakar Bank","RBS(The Royal Bank of Scotland)","Saraswat Bank","Shamrao Vitthal Co-operative Bank","South Indian Bank","Standard Chartered Bank","State Bank of Bikaner and Jaipur","State Bank of Hyderabad","State Bank of India","State Bank of Mysore","State Bank of Patiala","State Bank of Travencore","Syndicate Bank","Tamilnad Mercantile Bank","Tamilnadu State Coop Bank","UCO Bank","Union Bank of India","United Bank of India","Vijaya Bank","Yes Bank"]
        
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
        back_btn.addTarget(self, action: #selector(BankNameLists.backAction(_:)), for: UIControlEvents.touchUpInside)
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
        return bankNameArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        tableView.separatorColor = UIColor.clear
        
        let bankName=UILabel(frame:CGRect(x:10,y:20,width:dimensions.SCREEN_WIDTH-20,height:20))
        bankName.text=bankNameArray.object(at: indexPath.row) as? String
        bankName.font=UIFont.systemFont(ofSize: 14)
        
        let line=UIView(frame:CGRect(x:0,y:cell.frame.size.height-1,width:dimensions.SCREEN_WIDTH,height:0.6))
        line.backgroundColor=UIColor.lightGray
        
        cell.contentView.addSubview(bankName)
        cell.contentView.addSubview(line)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bankNameUserDefaults=UserDefaults.standard
        bankNameUserDefaults.set((bankNameArray.object(at: indexPath.row) as? String)!, forKey: "bankName")
        bankNameUserDefaults.synchronize()
        _ = self.navigationController?.popViewController(animated: true)
        
    }
}


