//
//  ClassesCoordinator.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation
import UIKit

class ClassesCoordinator: NSObject, Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ClassesViewModel()
        navigationController.delegate = self

        
        let classesViewController = ClassesViewController.instantiate(viewModel: viewModel)
        classesViewController.coordinator = self
        navigationController.pushViewController(classesViewController, animated: true)
    }
    
    func goToClassDnD(path: String) {
        let child = ClassDnDCoordinator(navigationController: navigationController, path: path)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() where child === coordinator {
            childCoordinators.remove(at: index)
        }
    }
}

extension ClassesCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.view(forKey: .from) else { return }
        if viewController.contains(fromViewController) {
            return
        }
    }
}
