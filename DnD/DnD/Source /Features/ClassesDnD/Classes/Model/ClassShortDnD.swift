//
//  ClassShortDnD.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

struct ClassShortDnD: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    var name: String
    var url: String
}
