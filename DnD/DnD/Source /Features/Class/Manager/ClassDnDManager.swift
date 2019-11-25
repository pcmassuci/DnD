//
//  ClassDnDManager.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 19/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol ClassDnDManagerProtocol {
    func fetchClassesList(urlString: String, completion: @escaping ClassDnDCompletion)
}

class ClassDnDManager: ClassDnDManagerProtocol {
    private var classAPI: ClassDnDAPIProtocol
    
    func fetchClassesList(urlString: String, completion: @escaping ClassDnDCompletion) {
        classAPI.fetchClassFullDnD(urlString: urlString) { result in
            completion(result)
        }
    }
    
    init(classesAPI: ClassDnDAPIProtocol = ClassDnDAPI()) {
        self.classAPI = classesAPI
    }
}
