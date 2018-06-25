//
//  FinancialPlanningCell.swift
//  Fincart
//
//  Created by Kamal on 03/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation

class FinancialPlanningCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
