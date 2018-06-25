//
//  GoalsReviewTableViewCell.swift
//  Fincart
//
//  Created by Kamal on 25/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

protocol UITableViewCellDelegate : class {
    func goalsReviewCellEditTap(_ sender: GoalsReviewTableViewCell)
    func goalsReviewCellRemoveTap(_ sender: GoalsReviewTableViewCell)
    func goalsReviewCellReCalculateTap(_ sender: GoalsReviewTableViewCell)
    func goalsReviewCellChangeInvestmentType(_ sender: GoalsReviewTableViewCell)
}

class GoalsReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var goalsImageView: UIImageView!
    @IBOutlet weak var amountValueLabel: UILabel!
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var fundValueLabel: UILabel!
    @IBOutlet weak var investValueLabel: UILabel!
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var goalName: UILabel!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var editViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var recalculateButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var editButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var editViewLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var investmentAmountTextField: UITextField!
    @IBOutlet weak var investAmountTextFieldWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var investmentTypeLabel: UILabel!
    weak var delegate: UITableViewCellDelegate?
    
    @IBOutlet weak var childView: UIView!
    func cellDisplayContent(_ amountValueLabelText: String, durationValueLabelText: String, fundValueLabelText: String, investValueLabelText: String){
        //let image : UIImage! = UIImage(named: imageName)
        //imageView.image = image
        amountValueLabel.text = amountValueLabelText
        durationValueLabel.text = durationValueLabelText
        fundValueLabel.text = fundValueLabelText
        investValueLabel.text = investValueLabelText
    }
    
    @IBAction func reCalculateAction(_ sender: Any) {
        delegate?.goalsReviewCellReCalculateTap(self)
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        delegate?.goalsReviewCellEditTap(self)
    }
    
    @IBAction func removeButtonAction(_ sender: Any) {
        delegate?.goalsReviewCellRemoveTap(self)
    }
    
    @IBAction func investmentTypeSelect(_ sender: Any) {
        delegate?.goalsReviewCellChangeInvestmentType(self)
    }
    
}
