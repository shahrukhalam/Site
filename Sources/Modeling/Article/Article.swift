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
        public let relativeURL: String
        public let absoluteURL: String
        
        public init(title: String, intro: String, banner: String, relativeURL: String, absoluteURL: String) {
            self.title = title
            self.intro = intro
            self.banner = banner
            self.relativeURL = relativeURL
            self.absoluteURL = absoluteURL
        }
    }
    
    public let detail: Detail
    public let markdown: String
    
    public init(detail: Detail, markdown: String) {
        self.markdown = markdown
        self.detail = detail
    }
}
