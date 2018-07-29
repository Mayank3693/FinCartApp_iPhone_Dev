//
//  GoalCell.swift
//  Fincart
//
//  Created by mayank on 24/07/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

protocol GoalListDelegate {
    func mapWithGoal(index :Int)
    //    func modify(index :Int)
    //    func Activte(index :Int)
}

class GoalCell: UITableViewCell {
    var delegate  :  GoalListDelegate?
    @IBOutlet weak var cellHeader: UILabel!
    @IBOutlet weak var investLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var pendingLabel: UILabel!
    @IBOutlet weak var modifyBtn: UIButton!
    @IBOutlet weak var activateBtn: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var desLabel: UILabel!
    
    override func awakeFromNib() {
        activateBtn.layer.cornerRadius = 10.0
        modifyBtn.layer.cornerRadius = 10.0
        mainView.layer.cornerRadius = 10.0
    }

    override func layoutSubviews() {
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize(width: 0, height: 1)
        mainView.layer.shadowOpacity = 0.6
        mainView.layer.shadowRadius = 5
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
