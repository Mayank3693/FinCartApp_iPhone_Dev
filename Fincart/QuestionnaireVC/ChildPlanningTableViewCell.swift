//
//  ChildPlanningTableViewCell.swift
//  Fincart
//
//  Created by Kamal on 30/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit
import DLRadioButton

protocol ChildPlanningTableViewCellDelegate: class {
    func selectPlanAction(_ sender: ChildPlanningTableViewCell, value: Bool)
}

class ChildPlanningTableViewCell: UITableViewCell {

    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var labelwidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var childNameLabel: UILabel!
    weak var delegate: ChildPlanningTableViewCellDelegate?
    @IBOutlet weak var parentView: UIView!
    
    @IBAction func selectPlanForChild(_ sender: Any) {
       let test = sender as! UISwitch
        delegate?.selectPlanAction(self, value:test.isOn)
    }
    
    
}
