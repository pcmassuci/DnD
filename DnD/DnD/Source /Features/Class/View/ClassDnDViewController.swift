//
//  ClassDnDViewController.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 19/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class ClassDnDViewController: UIViewController, Identifiable {
    weak var coordinator: ClassDnDCoordinator?
    @IBOutlet private weak var  tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
        }
    }
    private var viewModel: ClassDnDViewModelProtocol?
    
    static func instantiate(viewModel: ClassDnDViewModelProtocol) -> ClassDnDViewController {
        let viewController: ClassDnDViewController = UIStoryboard.viewController(from: .classDnD)
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinish()
    }
}

extension ClassDnDViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension ClassDnDViewController: UITableViewDelegate {
    
}
