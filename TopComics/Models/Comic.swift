//
//  Comic.swift
//  TopComics
//
//  Created by Jessica Lewinter on 16/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

struct Comic: Codable{
    let comicResults: [ComicResults]

    enum CodingKeys: String, CodingKey{
        case comicResults = "results"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        comicResults = try container.decode([ComicResults].self, forKey: .comicResults)
    }
    func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
        var comicResults = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .comicResults)
        try comicResults.encode(self.comicResults, forKey: .comicResults)
    }
}

struct ComicResults: Codable {
    let name: String
    let realName: String
    let summary: String
    let info: String
    
    enum CodingKeys: String, CodingKey{
        case name
        case realName = "real_name"
        case summary = "deck"
        case info = "description"
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        realName =  try container.decode(String.self, forKey: .realName)
        summary =  try container.decode(String.self, forKey: .summary)
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
