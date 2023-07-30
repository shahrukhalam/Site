//
//  Article.swift
//  
//
//  Created by Shahrukh Alam on 08/08/2022.
//

import Foundation

public struct Article {
    public struct Detail {
        public enum Byline {
            case published(Date)
            case updated(Date)
            case author(name: String, url: String)
        }
        
        public let title: String
        public let intro: String
        public let banner: String
        public let tags: [String]
        public let bylines: [Byline]
        
        public init(title: String, intro: String, banner: String, tags: [String], bylines: [Byline] = []) {
            self.title = title
            self.intro = intro
            self.banner = banner
            self.tags = tags
            self.bylines = bylines
        }
    }
    
    public let detail: Detail
    public let markdown: String
    public let relativeURL: String
    public let absoluteURL: String
    public let isSharable: Bool

    public init(detail: Detail, markdown: String, relativeURL: String, absoluteURL: String, isSharable: Bool) {
        self.detail = detail
        self.markdown = markdown
        self.relativeURL = relativeURL
        self.absoluteURL = absoluteURL
        self.isSharable = isSharable
    }
}

public extension Date {
    var bylineFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yy"
        return dateFormatter.string(from: self)
    }
}
