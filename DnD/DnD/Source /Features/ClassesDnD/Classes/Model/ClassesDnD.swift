//
//  ClassDnD.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

struct ClassesDnD: Decodable {
    enum CodingKeys: String, CodingKey {
        case count
        case results
    }
    
    var count: Int
    var results: [ClassShortDnD]
}
