//
//  SipListVC.swift
//  Fincart
//
//  Created by Pankaj Raghav on 27/06/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

class SipListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var sipListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Table view Data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sipListTableView.dequeueReusableCell(withIdentifier: "SipListCell") as! SipListCell
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class SipListCell: UITableViewCell {
    @IBOutlet weak var cellHeader: UILabel!
    @IBOutlet weak var investLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var pendingLabel: UILabel!
    @IBOutlet weak var modifyBtn: UIButton!
    @IBOutlet weak var activateBtn: UIButton!
    @IBOutlet weak var mapWithGoalBtn: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        activateBtn.layer.cornerRadius = 10.0
        modifyBtn.layer.cornerRadius = 10.0
        mainView.layer.cornerRadius = 10.0
        mapWithGoalBtn.layer.cornerRadius = 10.0
        
    }


    
    
    
}
