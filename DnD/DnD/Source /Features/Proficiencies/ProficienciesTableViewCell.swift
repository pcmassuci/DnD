//
//  ProficienciesTableViewCell.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 25/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class ProficienciesTableViewCell: UITableViewCell, Identifiable, NibLoadableView {
    @IBOutlet private weak var titleLabel: UILabel?
    
    func setupProficienciesTableViewCell(title: String) {
        self.titleLabel?.text = title
    }
}
