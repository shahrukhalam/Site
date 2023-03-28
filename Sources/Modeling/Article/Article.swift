//
//  Article.swift
//  
//
//  Created by Shahrukh Alam on 08/08/2022.
//

public struct Article {
    public struct Detail {
        public let title: String
        public let intro: String
        public let banner: String
        
        public init(title: String, intro: String, banner: String) {
            self.title = title
            self.intro = intro
            self.banner = banner
        }
    }
    
    public let detail: Detail
    public let markdown: String
    public let relativeURL: String
    public let absoluteURL: String
    
    public init(detail: Detail, markdown: String, relativeURL: String, absoluteURL: String) {
        self.detail = detail
        self.markdown = markdown
        self.relativeURL = relativeURL
        self.absoluteURL = absoluteURL
    }
}
