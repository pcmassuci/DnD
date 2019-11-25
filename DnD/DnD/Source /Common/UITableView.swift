//
//  UITableView.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

extension UITableView {
    
    /**
     Register a Class-Based `UITableViewCell` subclass (conforming to `Identifiable`)
     - parameter cellType: the `UITableViewCell` (`Identifiable`-conforming) subclass to register
     */
    final func register<T: UITableViewCell>(cellType: T.Type) where T: Identifiable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    /**
     Register a NIB-Based `UITableViewCell` subclass (conforming to `Identifiable` & `NibLoadableView`)
     - parameter cellType: the `UITableViewCell` (`Identifiable` & `NibLoadableView`-conforming) subclass to register
     */
    final func register<T: UITableViewCell>(cellType: T.Type) where T: Identifiable & NibLoadableView {
        let bundle = Bundle(for: cellType.self)
        let nib = UINib(nibName: cellType.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    /**
     Returns a reusable `UITableViewCell` object for the class inferred by the return-type
     - parameter indexPath: The index path specifying the location of the cell.
     - parameter cellType: The cell class to dequeue
     - returns: A `Identifiable`, `UITableViewCell` instance
     - note: The `cellType` parameter can generally be omitted and infered by the return type,
     except when your type is in a variable and cannot be determined at compile time.
     */
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Identifiable {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(cellType.reuseIdentifier)")
        }
        return cell
    }
}
