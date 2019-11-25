//
//  ClassDnDViewModel.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 19/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol ClassDnDViewModelProtocol {
    var classDnD: Bindable<ClassFullDnD?> { get set }
    var hasError: Bindable<Bool> { get set }
    
    func fetchClassDnD()
}

class ClassDnDViewModel: ClassDnDViewModelProtocol {
    var classDnD = Bindable<ClassFullDnD?>(nil)
    var hasError = Bindable<Bool>(false)
    private let urlString: String
    private let manager: ClassDnDManagerProtocol
    
    func fetchClassDnD() {
        manager.fetchClassesList(urlString: urlString) { [weak self] result in
            guard let self = self else { return }
            if result.error == .none {
                self.classDnD.value = result.classesDnD
                return
            }
            self.hasError.value = true
        }
    }
    
    init(manager: ClassDnDManagerProtocol = ClassDnDManager(), urlString: String) {
        self.manager = manager
        self.urlString = urlString
    }
}
