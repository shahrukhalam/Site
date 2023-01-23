//
//  ArticleTag.swift
//  
//
//  Created by Shahrukh Alam on 18/09/22.
//

public struct ArticleTag {
    let id: String
    let name: String
    let hexColor: String
}

extension Array where Element == ArticleTag {
    var title: String { "Learn iOS Development with short & sweet articles" }
    
    var description: String {
        "Articles related to " + map { $0.name }.joined(separator: ", ")
    }
    
    var keywords: [String] { map { $0.name } }
}
