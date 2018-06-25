//
//  OccupationsList
//  Fincart
//
//  Created by Ankit Bisht on 1/30/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class CountryLists: UITableViewController {
    
    var countryArray=NSArray()
    var colors=Colors()
    var dimensions=Dimensions()
    var images=Images()
    var countryFlag=Int()
    var controllerName=String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addNav()
        
        countryArray=["Afghanistan","Aland Islands","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica","Antigua And Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bonaire, Sint Eustatius And Saba","Bosnia And Herzegovina","Botswana","Bouvet Island","Brazil","British Indian Ocean Territory","Brunei Darussalam","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central African Republic","Chad","Chile","China","Christmas Island","Cocos Keeling Islands","Colombia","Comoros","Congo","Cook Islands","Costa Rica","Cote Divoire","Croatia","Cuba","Curacao","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominician Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands(Malvinas)","Faroe Islands","Fiji","Finland","France","French Guiana","French Polynesia","French Southern Territories","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guernsey","Guinea","Guinea-Bissau","Guyana","Haiti","Heard Island And McDonald Islands","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iraq","Ireland","Isle Of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kiribati","Korea","Kuwait","Kyrgyzstan","Lao Peoples Democratic Republic","Latvia","Lebanon","Lesotho","Liberia","Libyan Arab Jamahiriya","Liechtenstein","Lithuania","Luxembourg","Macao","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Micronesia","Moldova","Monaco","Monolia","Montenegro","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Niue","Norfolk Island","Northen Mariana Islands","Norway","Not categorised","Oman","Others","Pakistan","Palau","Palestinian Territory, Occupied","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Pitcairn","Poland","Portugal","Puerto Rico","Qatar","Reunion Island","Romania","Russian Federation","Rwanda","Saint Barthelemy","Saint Helena, Ascension And Tristan da Cunha","Saint Kitts And Nevis","Saint Lucia","Saint Martin","Saint Pierre And Miquelon","Saint Vincent And The Grenadines","Samoa","San Marino","Sao Tome And Principe","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Sint Maarten","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia And The South Sandwich Islands","South Sudan","Spain","Sri Lanka","Sudan","Suriname","Svalbard And Jan Mayen Islands","Swaziland","Sweden","Switzerland","Syrian Arab Republic","Taiwan, Province Of China","Tajikistan","Tanzania","Thailand","Timor-Leste","Togo","Tokelau","Tonga","Trinidad And Tobago","Tunisia","Turkey","Turkmenistan","Turks And Caicos Islands","Tuvalu","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","United States Minor Outlying Islands","Uruguay","Uzbekistan","Vanuatu","Vatican City Satte","Venezuela","Viet Nam","Virgin Islands, British","Virgin Islands, U.S","Wallis And Futuna","Western Sahara","Yemen","Zambia","Zimbabwe"]
        
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
        back_btn.addTarget(self, action: #selector(CountryLists.backAction(_:)), for: UIControlEvents.touchUpInside)
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
        return countryArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        
        for view in cell.contentView.subviews{
            view.removeFromSuperview()
        }
        tableView.separatorColor = UIColor.clear
        
        let bankName=UILabel(frame:CGRect(x:10,y:20,width:dimensions.SCREEN_WIDTH-20,height:20))
        bankName.text=countryArray.object(at: indexPath.row) as? String
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
        
        let countryUserDefaults=UserDefaults.standard
        if controllerName == "Fatka"{
            countryUserDefaults.set((countryArray.object(at: indexPath.row) as? String)!, forKey: "fatkaController")
        }
        else {
            countryUserDefaults.set((countryArray.object(at: indexPath.row) as? String)!, forKey: "countryName")
        }
        countryUserDefaults.synchronize()
        
        let controllerFlagDefaults=UserDefaults.standard
        if countryFlag == 1{
            controllerFlagDefaults.set("1", forKey: "nriCountryName")
        }
        else if countryFlag == 2{
            controllerFlagDefaults.set("2", forKey: "nriCountryName")
        }
        else {
            controllerFlagDefaults.set("3", forKey: "nriCountryName")
        }
        controllerFlagDefaults.synchronize()
        
        _ = self.navigationController?.popViewController(animated: true)

    }
}



