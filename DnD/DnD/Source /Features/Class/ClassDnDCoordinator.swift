//
//  ClassDnDCoordinator.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 19/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation
import UIKit

class ClassDnDCoordinator: Coordinator {
    weak var parentCoordinator: ClassesCoordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    private var path: String
    
    init(navigationController: UINavigationController, path: String) {
        self.navigationController = navigationController
        self.path = path
    }
    
    func start() {
        let viewModel = ClassDnDViewModel(urlString: path)
        let viewController = ClassDnDViewController.instantiate(viewModel: viewModel)
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
