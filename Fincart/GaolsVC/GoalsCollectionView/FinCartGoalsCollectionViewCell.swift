//
//  FinCartGoalsCollectionView.swift
//  Fincart
//
//  Created by Kamal on 09/01/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import Foundation
import UIKit

class FinCartGoalsCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var pencilImage: UIImageView!
    @IBOutlet weak var parentView: UIView!
    func cellDisplayContent(_ imageName: String){
        let image : UIImage! = UIImage(named: imageName)
        imageView.image = image
    }
    
}
