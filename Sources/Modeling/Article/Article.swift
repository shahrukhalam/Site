//
//  Article.swift
//  
//
//  Created by Shahrukh Alam on 08/08/2022.
//

public struct Article {
    public let markdown: String
    public let title: String
    public let intro: String
    public let banner: String
    public let url: String
    
    public init(markdown: String, title: String, intro: String, banner: String, url: String) {
        self.markdown = markdown
        self.title = title
        self.intro = intro
        self.banner = banner
        self.url = url
    }
}
