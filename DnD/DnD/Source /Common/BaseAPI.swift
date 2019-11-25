//
//  BaseAPI.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]
typealias BaseResult = (Data?, ErrorApi) -> Void

enum ErrorApi {
    case none
    case server
    case connection
    case parser
    case unknown
}

protocol BaseAPIProtocol {
    func fetchResults(urlPath: String, query: String?, completion: @escaping BaseResult)
    
    func fetchResults(urlString: String, completion: @escaping BaseResult)
}

// MARK: - Query Service
class BaseAPI: BaseAPIProtocol {
    private let urlBaseString = "http://dnd5eapi.co/api/"
    private let session = URLSession.shared
    
    // MARK: - Internal Methods
    func fetchResults(urlPath: String, query: String?, completion: @escaping BaseResult) {
        var urlComponents = URLComponents(string: "\(urlBaseString)\(urlPath)")
        if let query = query {
            urlComponents?.query = "q=\(query)"
        }
        guard let url = urlComponents?.url else { return }
        
        let task = session.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(nil, .server)
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, .unknown)
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(data, .none)
            }
        }
        
        task.resume()
    }
    
    func fetchResults(urlString: String, completion: @escaping BaseResult) {
        
        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(nil, .server)
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, .unknown)
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(data, .none)
            }
        }
        
        task.resume()
    }
}
