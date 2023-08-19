//
//  Article.swift
//  
//
//  Created by Shahrukh Alam on 08/08/2022.
//

import Foundation

public struct Article {
    public struct Detail {
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

public extension Article.Detail {
    enum Byline {
        /// Format: Jul 28, 23 (`MMM dd, yy`)
        case published(date: String)
        /// Format: Jul 28, 23 (`MMM dd, yy`)
        case updated(date: String)
        case author(name: String, url: String)
    }
    
    struct SubsectionTag: Codable, Equatable, Identifiable {
        public var id: UUID { .init() }

        public init(name: String, systemImageIOS: String) {
            self.name = name
            self.systemImageIOS = systemImageIOS
        }
        
        public let name: String
        public let systemImageIOS: String
    }
    
    struct SectionTag: Codable, Equatable, Identifiable {
        public var id: UUID { .init() }

        public init(name: String, subsections: [Article.Detail.SubsectionTag]) {
            self.name = name
            self.subsections = subsections
        }
        
        public let name: String
        public let subsections: [SubsectionTag]
    }
    
    struct Lite: Codable, Equatable, Identifiable {
        public var id: UUID { .init() }

        public let title: String
        public let banner: String
        
        public init(title: String, banner: String) {
            self.title = title
            self.banner = banner
        }
    }
}
