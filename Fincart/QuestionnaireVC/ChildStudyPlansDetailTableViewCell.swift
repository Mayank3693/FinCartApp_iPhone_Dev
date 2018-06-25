//
//  ChildPlansDetailTableViewCell.swift
//  Fincart
//
//  Created by Kamal on 30/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

protocol ChildStudyPlansDetailTableViewCellDelegate: class {
    func selectStudyLocationAction(_ sender: ChildStudyPlansDetailTableViewCell)
}

class ChildStudyPlansDetailTableViewCell: UITableViewCell {
    weak var delegate: ChildStudyPlansDetailTableViewCellDelegate?
    
    @IBOutlet weak var childNameLabel: UILabel!
    @IBOutlet weak var studyLocationLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    @IBAction func selectStudyLocationAction(_ sender: UIButton) {
        delegate?.selectStudyLocationAction(self)
    }
}
