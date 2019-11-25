//
//  ClassDnDAPI.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 19/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

typealias ClassDnDResult = (classesDnD: ClassFullDnD?, error: ErrorApi)
typealias ClassDnDCompletion = (ClassDnDResult) -> Void

protocol ClassDnDAPIProtocol {
    func fetchClassFullDnD(urlString: String, completion: @escaping ClassDnDCompletion)
}

class ClassDnDAPI: ClassDnDAPIProtocol {
    
    private var errorStatus = ErrorApi.none
    private let baseApi: BaseAPIProtocol
    
    var classFullDnD: ClassFullDnD?
    
    init(baseApi: BaseAPIProtocol = BaseAPI()) {
        self.baseApi = baseApi
    }
    
    func fetchClassFullDnD(urlString: String, completion: @escaping ClassDnDCompletion) {
        baseApi.fetchResults(urlPath: ClassesAPI.classesPath, query: nil) { dataUsers, _ in
            guard let dataUsers = dataUsers else {
                completion((nil, ErrorApi.server))
                return
            }
            self.updateSearchResults(dataUsers)
            completion((self.classFullDnD, self.errorStatus))
        }
    }
    
    private func updateSearchResults(_ data: Data) {
        classFullDnD = nil
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json )
            classFullDnD = try JSONDecoder().decode(ClassFullDnD.self, from: data)
        } catch _ as NSError {
            errorStatus = ErrorApi.parser
            return
        }
    }
}
