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
        public let url: String
        
        public init(title: String, intro: String, banner: String, url: String) {
            self.title = title
            self.intro = intro
            self.banner = banner
            self.url = url
        }
    }
    
    public let detail: Detail
    public let markdown: String
    
    public init(detail: Detail, markdown: String) {
        self.markdown = markdown
        self.detail = detail
    }
}
