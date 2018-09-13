//
//  DisheshViewModel.swift
//  MVVMExample
//
//  Created by anoop on 9/13/18.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation
import UIKit

struct CompanyViewModel {
    let comName:String
    let accessoryType:UITableViewCellAccessoryType
    init(company:Company) {
        self.comName = company.name
        if ((company.name.lowercased() == "apple") || (company.name.lowercased() == "samsung")) {
            accessoryType = .detailDisclosureButton
        } else {
            accessoryType = .none
        }
    }
}
