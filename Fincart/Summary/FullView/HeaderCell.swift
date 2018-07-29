//
//  HeaderCell.swift
//  CarbanKit
//
//  Created by Mayank on 23/07/18.
//  Copyright © 2018 Mayank. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
