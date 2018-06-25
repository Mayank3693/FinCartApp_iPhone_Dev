//
//  ChildWeddingPlanDetailsTableCell.swift
//  Fincart
//
//  Created by Kamal on 02/04/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

protocol ChildWeddingPlansDetailTableViewCellDelegate: class {
    func selectWeddingTypeAction(_ sender: ChildWeddingPlanDetailsTableCell)
}

class ChildWeddingPlanDetailsTableCell: UITableViewCell {

    weak var delegate: ChildWeddingPlansDetailTableViewCellDelegate?
    
    @IBOutlet weak var childNameLabel: UILabel!
    @IBOutlet weak var weddingTypeLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    @IBAction func selectWeddingTypeAction(_ sender: UIButton) {
        delegate?.selectWeddingTypeAction(self)
    }

}
