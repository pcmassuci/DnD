//
//  ClassesTableViewCell.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//
import UIKit

class ClassesTableViewCell: UITableViewCell, Identifiable, NibLoadableView {
    @IBOutlet private weak var classNameLabel: UILabel?
    
    func setup(_ className: String) {
        classNameLabel?.text = className
    }
}
