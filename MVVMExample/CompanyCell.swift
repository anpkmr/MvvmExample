//
//  CompanyCell.swift
//  MVVMExample
//
//  Created by anoop on 9/13/18.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation
import UIKit

class CompanyCell: UITableViewCell {
    
    var companyVM:CompanyViewModel! {
        didSet {
            textLabel?.text = self.companyVM.comName
            accessoryType = self.companyVM.accessoryType
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(false, animated: false)
    }
    
}
