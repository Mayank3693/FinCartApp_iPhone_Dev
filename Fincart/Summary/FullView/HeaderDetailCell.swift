//
//  HeaderDetailCell.swift
//  CarbanKit
//
//  Created by Mayank on 23/07/18.
//  Copyright © 2018 Mayank. All rights reserved.
//

import UIKit

class HeaderDetailCell: UITableViewCell {

    @IBOutlet weak var invested: UILabel!
    @IBOutlet weak var worth: UILabel!
    @IBOutlet weak var gain: UILabel!
    @IBOutlet weak var cagr: UILabel!
    @IBOutlet weak var investedView: UIView!
    @IBOutlet weak var worthView: UIView!
    @IBOutlet weak var gainView: UIView!
    @IBOutlet weak var cagrView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        self.setOpacity(viewName: self.investedView)
        self.setOpacity(viewName: self.worthView)
        self.setOpacity(viewName: self.gainView)
        self.setOpacity(viewName: self.cagrView)
    }
    
    func setOpacity(viewName : UIView){
        viewName.layer.shadowColor = UIColor.black.cgColor
        viewName.layer.shadowOffset = CGSize(width: 0, height: 1)
        viewName.layer.shadowOpacity = 0.6
        viewName.layer.shadowRadius = 5
    }
    
}
