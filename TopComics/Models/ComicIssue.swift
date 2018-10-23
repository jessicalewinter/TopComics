//
//  ComicIssues.swift
//  TopComics
//
//  Created by Jessica Lewinter on 23/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit

struct ComicIssue: Codable{
    var issueResults: [IssueResults]
    
    enum CodingKeys: String, CodingKey{
        case issueResults = "results"
    }
    
}

struct IssueResults: Codable {
    var name: String?
    var coverDate: String?
    var description: String?
    var image: String?
    
    enum CodingKeys: String, CodingKey{
        case name
        case coverDate = "cover_date"
        case description
        case image
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(String.self, forKey: .name)
        coverDate =  try? container.decode(String.self, forKey: .coverDate)
        description =  try? container.decode(String.self, forKey: .description)
        let images =  try container.decode([String: String].self, forKey: .image)
        image = images["medium_url"]
    }
    
}
