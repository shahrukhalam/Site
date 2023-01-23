//
//  ArticleStyle.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import HTMLDSL

public struct ArticleStyle: CSSStyle {
    public let key: CustomStringConvertible = Tag.empty.description
    public let styles = [Style]()
    
    public var element: String
    
    public init() {
        let articleStyle = ClassStyle(forClass: .article)
            .backgroundColor(isDarkMode ? Color.Dark.ArticleBackground : Color.Light.ArticleBackground)
            .padding(bottom: .pixel(20))
        self.element = articleStyle.element
    }
}
