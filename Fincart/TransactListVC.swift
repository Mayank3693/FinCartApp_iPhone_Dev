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
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5//self.transactList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  self.tableView.frame.size.height*0.3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    =   self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
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
