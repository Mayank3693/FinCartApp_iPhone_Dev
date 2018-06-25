//
//  ChildInfoTableViewCell.swift
//  Fincart
//
//  Created by Kamal on 30/03/18.
//  Copyright © 2018 Aman Taneja. All rights reserved.
//

import UIKit

protocol ChildInfoTableViewCellDelegate: class {
    func selectChildGender(_ sender: ChildInfoTableViewCell)
    func selectChildAge(_ sender: ChildInfoTableViewCell)
    func selectedChildAge(_ sender: ChildInfoTableViewCell, age: String)
}

class ChildInfoTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    weak var delegate: ChildInfoTableViewCellDelegate?
    var isPickerViewHidden: Bool? = true
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var childNameTestField: UITextField!
    @IBOutlet weak var childGenderLabel: UILabel!
    @IBOutlet weak var childYearLabel: UILabel!
    @IBOutlet weak var genderViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var genderCategoryContainer: UIView!
    @IBOutlet weak var ageContainer: UIView!
    
    var pickerDataSource:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11",
                                     "12", "13", "14", "15", "16", "17", "18"]
    
    @IBAction func selectChildGender(_ sender: Any) {
        delegate?.selectChildGender(self)
    }
    
    @IBAction func selectChildAge(_ sender: Any) {
        delegate?.selectChildAge(self)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.selectedChildAge(self, age: pickerDataSource[row])
    }
    
}
