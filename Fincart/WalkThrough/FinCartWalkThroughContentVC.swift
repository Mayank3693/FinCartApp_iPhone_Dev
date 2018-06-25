//
//  FinCartWalkThroughContentVC.swift
//  Fincart
//
//  Created by Kamal on 11/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation
import UIKit

class FinCartWalkThroughContentVC: UIViewController{
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var pageIndex: Int = 0
    var headerText: String?
    var messageText: String?
    var imageString: String?
    @IBOutlet weak var logoImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = messageText
        headerLabel.text = headerText
        imageView.image = UIImage(named: imageString!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.view.frame.size.width < 375{
            logoImageViewWidthConstraint.constant = 200
            imageViewWidthConstraint.constant = 100
        }
    }
}
