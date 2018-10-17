//
//  Comic.swift
//  TopComics
//
//  Created by Jessica Lewinter on 16/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

struct Comic: Codable{
    var characterResults: [CharacterResults]

    enum CodingKeys: String, CodingKey{
        case characterResults = "results"
    }
    
}

struct CharacterResults: Codable {
    var name: String?
    var realName: String?
    var summary: String?
    let info: String
    
    enum CodingKeys: String, CodingKey{
        case name
        case realName = "real_name"
        case summary = "deck"
        case info = "description"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(String.self, forKey: .name)
        realName =  try? container.decode(String.self, forKey: .realName)
        summary =  try? container.decode(String.self, forKey: .summary)
        info =  try container.decode(String.self, forKey: .info)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(realName, forKey: .realName)
        try container.encode(summary, forKey: .summary)
        try container.encode(info, forKey: .info)
    }
}
