//
//  ClassesManager.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol ClassesManagerProtocol {
    func fetchClassesList(completion: @escaping ClassesCompletion)
}

class ClassesManager: ClassesManagerProtocol {
    private var classesAPI: ClassesAPIProtocol
    
    func fetchClassesList(completion: @escaping ClassesCompletion) {
        classesAPI.fetchClassesList { result in
            completion(result)
        }
    }
    
    init(classesAPI: ClassesAPIProtocol = ClassesAPI()) {
        self.classesAPI = classesAPI
    }
}
