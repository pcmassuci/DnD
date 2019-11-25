//
//  ClassFullDnD.swift
//  DnD
//
//  Created by Paulo Cesar Morandi Massuci on 18/11/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

struct ClassFullDnD: Decodable {
    enum CodingKeys: String, CodingKey {
        case idClass = "_id"
        case index
        case name
        case hitDie = "hit_die"
        case proficiencyChoices = "proficiency_choices"
        case proficiencies = "proficiencies"
        case savingThrows = "saving_throws"
        case startingEquipment = "starting_equipment"
        case classLevels = "class_levels"
        case subclasses = "subclasses"
    }
    
    var idClass: String
    var index: Int
    var name: String
    var hitDie: Int
    var proficiencyChoices: ProficiencyChoices
    var proficiencies: [BasicModel]
    var savingThrows: [BasicModel]
    var startingEquipment: [BasicModel]
    var classLevels: [BasicModel]
    var subclasses: [BasicModel]
}

struct ProficiencyChoices: Decodable {
    enum CodingKeys: String, CodingKey {
        case proficiencies = "from"
    }
    
    var proficiencies: [BasicModel]
}

struct BasicModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    var name: String
    var url: String
}

//
//{
//    "_id": "5bce90ff5b7768e792017cf3",
//    "index": 1,
//    "name": "Barbarian",
//    "hit_die": 12,
//    "proficiency_choices": [
//    {
//    "from": [
//    {
//    "name": "Skill: Animal Handling",
//    "url": "http://www.dnd5eapi.co/api/proficiencies/106"
//    },
//    {
//    "name": "Skill: Athletics",
//    "url": "http://www.dnd5eapi.co/api/proficiencies/108"
//    },
//    {
//    "name": "Skill: Intimidation",
//    "url": "http://www.dnd5eapi.co/api/proficiencies/112"
//    },
//    {
//    "name": "Skill: Nature",
//    "url": "http://www.dnd5eapi.co/api/proficiencies/115"
//    },
//    {
//    "name": "Skill: Perception",
//    "url": "http://www.dnd5eapi.co/api/proficiencies/116"
//    },
//    {
//    "name": "Skill: Survival",
//    "url": "http://www.dnd5eapi.co/api/proficiencies/122"
//    }
//    ],
//    "type": "proficiencies",
//    "choose": 2
//    }
//    ],
//    "proficiencies": [
//    {
//    "url": "http://www.dnd5eapi.co/api/proficiencies/1",
//    "name": "Light armor"
//    },
//    {
//    "url": "http://www.dnd5eapi.co/api/proficiencies/2",
//    "name": "Medium armor"
//    },
//    {
//    "url": "http://www.dnd5eapi.co/api/proficiencies/18",
//    "name": "Shields"
//    },
//    {
//    "url": "http://www.dnd5eapi.co/api/proficiencies/19",
//    "name": "Simple weapons"
//    },
//    {
//    "url": "http://www.dnd5eapi.co/api/proficiencies/20",
//    "name": "Martial weapons"
//    }
//    ],
//    "saving_throws": [
//    {
//    "url": "http://www.dnd5eapi.co/api/ability-scores/1",
//    "name": "STR"
//    },
//    {
//    "url": "http://www.dnd5eapi.co/api/ability-scores/3",
//    "name": "CON"
//    }
//    ],
//    "starting_equipment": {
//        "url": "http://www.dnd5eapi.co/api/startingequipment/1",
//        "class": "Barbarian"
//    },
//    "class_levels": {
//        "url": "http://www.dnd5eapi.co/api/classes/Barbarian/levels",
//        "class": "Barbarian"
//    },
//    "subclasses": [
//    {
//    "name": "Berserker",
//    "url": "http://www.dnd5eapi.co/api/subclasses/1"
//    }
//    ],
//    "url": "http://www.dnd5eapi.co/api/classes/1"
//}
