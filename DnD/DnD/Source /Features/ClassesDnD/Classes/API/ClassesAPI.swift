//
//  ClassAPI.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

typealias ClassesResult = (classesDnD: ClassesDnD?, error: ErrorApi)
typealias ClassesCompletion = (ClassesResult) -> Void

protocol ClassesAPIProtocol {
    func fetchClassesList(completion: @escaping ClassesCompletion)
}

class ClassesAPI: ClassesAPIProtocol {
    static let classesPath = "classes"
    
    private var errorStatus = ErrorApi.none
    private let baseApi: BaseAPIProtocol
    
    var classesDnD: ClassesDnD?
    
    init(baseApi: BaseAPIProtocol = BaseAPI()) {
        self.baseApi = baseApi
    }
    
    func fetchClassesList(completion: @escaping ClassesCompletion) {
        baseApi.fetchResults(urlPath: ClassesAPI.classesPath, query: nil) { dataUsers, _ in
            guard let dataUsers = dataUsers else {
                completion((nil, ErrorApi.server))
                return
            }
            self.updateSearchResults(dataUsers)
            completion((self.classesDnD, self.errorStatus))
        }
    }
    
    private func updateSearchResults(_ data: Data) {
        classesDnD = nil
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json )
            classesDnD = try JSONDecoder().decode(ClassesDnD.self, from: data)
        } catch _ as NSError {
            errorStatus = ErrorApi.parser
            return
        }
    }
}
