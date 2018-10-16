//
//  Comic.swift
//  TopComics
//
//  Created by Jessica Lewinter on 16/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

struct Comic: Codable {
    let name: String
    let image: String
    let realName: String
    let summary: String
    let info: String
    let publisher: String
    
    
    enum CodingKeys: String, CodingKey{
        case name
        case image
        case realName = "real_name"
        case summary = "deck"
        case info = "description"
        case publisher
    }
}
