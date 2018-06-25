//
//  UserInfoTableViewCell.swift
//  Fincart
//
//  Created by Aman Taneja on 19/11/17.
//  Copyright © 2017 Aman Taneja. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var valueBox: UITextField!
    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var headingType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
