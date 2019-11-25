//
//  Storyboard.swift
//  gitApp
//
//  Created by Paulo Cesar Morandi Massuci on 14/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    enum Name: String {
        case classes = "Classes"
        case user = "User"
        case classDnD = "ClassDnD"
    }
    
    static func viewController<T: UIViewController>(from storyboard: UIStoryboard.Name) -> T where T: Identifiable {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: T.self.storyboardIdentifier) as? T else {
            fatalError("Could not instantiate ViewController with identifier: \(T.storyboardIdentifier)")
        }
        
        return viewController
    }
    
    /// Cria uma view controller a partir de storyboard com storyboard id
    ///
    /// - Parameters:
    ///   - storyboard: storyboard nome
    /// - Returns: view controller instanciada
    static func viewController<T: UIViewController>(from storyboard: UIStoryboard.Name, idStoryboard: String) -> T {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: idStoryboard) as? T else {
            fatalError("Could not instantiate ViewController with identifier: \(idStoryboard)")
        }
        
        return viewController
    }
}
