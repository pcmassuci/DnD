//
//  Identifiable.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 14/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Identifiable protocol

/// Usado para Identificadores de classes em geral
protocol Identifiable: AnyObject {}

/// Usado para identificar views que podem ser carregadas através de xib
protocol NibLoadableView: AnyObject {}

// MARK: - Identifiable Extension on UIViewController

extension Identifiable where Self: UIViewController {
    
    /// Cria um identifier usando o nome da classe
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    /// Cria um segue identifier usando o nome da classe ignorando "ViewController" no fim
    /// ex.: LoginViewController -> identifier: Login
    static var segueIdentifier: String {
        let identifier = String(describing: self)
        let vcString = "ViewController"
        let endIndex = identifier.index(identifier.endIndex, offsetBy: -vcString.count)
        return String(identifier[identifier.startIndex..<endIndex])
    }
}

// MARK: - Identifiable Extension on UITableViewCell
extension Identifiable where Self: UITableViewCell {
    
    /// Cria um identifier usando o nome da classe
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// MARK: - Identifiable Extension on UICollectionViewCell
extension Identifiable where Self: UICollectionViewCell {
    
    /// Cria um identifier usando o nome da classe
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// MARK: - NibLoadableView Extension on UIView
extension NibLoadableView where Self: UIView {
    
    /// Recupera o nibName pelo noma da classe
    static var nibName: String {
        return String(describing: self)
    }
}
