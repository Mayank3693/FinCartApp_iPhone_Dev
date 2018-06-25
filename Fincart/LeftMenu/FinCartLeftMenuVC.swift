//
//  FinCartLeftMenuVC.swift
//  Fincart
//
//  Created by Kamal on 09/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

protocol FinCartLeftMenuVCDelegate {
    func leftMenu(_ leftMenuVC : FinCartLeftMenuVC!, selectionIndex: NSInteger) -> Void
}

class FinCartLeftMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var menuVCTableView: UITableView!
    var fincartLeftMenuVCDelegate: FinCartLeftMenuVCDelegate?
    var optionsArray : [String] = ["Summary", "Goals", "Profile", "My Investment", "Cart", "Passbook", "Documents", "Set New Goal", "Buy Insurance", "Investment Account", "Referal", "Change Password", "Log Out"]
    
   // @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        let userNameString : String? = finCartUserDefaults.retrieveUserFullName()
        if userNameString != nil{
            userName.text = finCartUserDefaults.retrieveUserFullName()
        }
        menuVCTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellReuse")
        menuVCTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        //averageColorFromImage(UIImage(named: "default_user")!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let finCartUserDefaults = FinCartUserDefaults.sharedInstance
        let userImageData : UIImage? = finCartUserDefaults.loadImageWithFileName("userImage", _withExtension: "png", _directoryPath: NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0])
        if userImageData != nil{
            userImage.image = userImageData
        }
        //tableViewHeightConstraint.constant = CGFloat(optionsArray.count * 36)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userImage.layer.cornerRadius = userImage.frame.size.height/2
        userImage.clipsToBounds = true
        userImage.layer.borderWidth = 3.0
        userImage.layer.borderColor = UIColor.white.cgColor
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableViewHeightConstraint.constant = tableView.contentSize.height + 40
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuse", for: indexPath)
        cell.textLabel?.text = optionsArray[indexPath.row]
        cell.imageView?.image = UIImage(named: "full_finanicial")
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-light", size: 16)
        cell.imageView?.frame = CGRect(x: (cell.imageView?.frame.origin.x)!, y: (cell.imageView?.frame.origin.y)!, width: 30, height: 30)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.fincartLeftMenuVCDelegate?.leftMenu(self, selectionIndex: indexPath.row)
    }
    
    //private methods
    func averageColorFromImage(_ paramImage: UIImage) -> UIColor{
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let rgba = UnsafeMutableRawPointer.allocate(bytes: 4, alignedTo: 1)
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)
        let context = CGContext.init(data: rgba, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.draw(paramImage.cgImage!, in: CGRect(x: 0, y: 0, width: 1, height: 1))
        let redRGBA = rgba.load(as: UInt8.self)
        var offsetPointer = rgba + 1
        let greenRGBA = offsetPointer.load(as: UInt8.self)
        offsetPointer = rgba + 2
        let blueRGBA = offsetPointer.load(as: UInt8.self)
        offsetPointer = rgba + 3
        let alphaRGBA = offsetPointer.load(as: UInt8.self)
        if alphaRGBA > 0 {
            let alpha = CGFloat(alphaRGBA) / 255.0
            let multiplier: CGFloat = alpha / 255.0
            return UIColor(red: CGFloat(redRGBA) * multiplier, green: CGFloat(greenRGBA) * multiplier, blue: CGFloat(blueRGBA) * multiplier, alpha: alpha)
        }
        else {
            return UIColor(red: CGFloat(redRGBA) / 255.0, green: CGFloat(greenRGBA) / 255.0, blue: CGFloat(blueRGBA) / 255.0, alpha: CGFloat(alphaRGBA) / 255.0)
        }
    }
    
}
