//
//  ClassesViewController.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class ClassesViewController: UIViewController, Identifiable {
    weak var coordinator: ClassesCoordinator?
    
    private var classesDnD: ClassesDnD? {
        didSet {
            tableView?.reloadData()
        }
    }
    private var hasError = false
    
    @IBOutlet private weak var tableView: UITableView? {
        didSet {
            tableView?.backgroundColor = .clear
            tableView?.delegate = self
            tableView?.dataSource = self
            registerCells()
        }
    }
    
    private var viewModel: ClassesViewModelProtocol? {
        didSet {
            viewModel?.classesDnD.bind { [weak self] classesDnD in
                guard let self = self else { return }
                self.classesDnD = classesDnD
            }
            
            viewModel?.hasError.bind { [weak self] hasError in
                guard let self = self else { return }
                self.hasError = hasError
            }
        }
    }
    
    static func instantiate(viewModel: ClassesViewModelProtocol) -> ClassesViewController {
        let viewController: ClassesViewController = UIStoryboard.viewController(from: .classes)
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchClassesList()
    }
    
    private func registerCells() {
        tableView?.register(cellType: ClassesTableViewCell.self)
    }
}

extension ClassesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classesDnD?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ClassesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if classesDnD?.results.count ?? 0 > indexPath.row,
            let classDnD = classesDnD?.results[indexPath.row] {
            cell.setup(classDnD.name)
        }
        
        return cell
    }
}

extension ClassesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let classes = classesDnD?.results,
        classes.count >= indexPath.row else { return }
        let classDnD = classes[indexPath.row]
        
        coordinator?.goToClassDnD(path: classDnD.url)
    }
}
