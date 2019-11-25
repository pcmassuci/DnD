//
//  ClassesViewModel.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol ClassesViewModelProtocol {
    var classesDnD: Bindable<ClassesDnD?> { get set }
    var hasError: Bindable<Bool> { get set }
    
    func fetchClassesList()
}

class ClassesViewModel: ClassesViewModelProtocol {
    var classesDnD = Bindable<ClassesDnD?>(nil)
    var hasError = Bindable<Bool>(false)

    private var manager: ClassesManagerProtocol
    
    func fetchClassesList() {
        manager.fetchClassesList { [weak self] result in
            guard let self = self else { return }
            if result.error == .none {
                self.classesDnD.value = result.classesDnD
            return
            }
            self.hasError.value = true
        }
    }
    
    init(manager: ClassesManagerProtocol = ClassesManager()) {
        self.manager = manager
    }
}
