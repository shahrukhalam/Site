//
//  DarkIndexBodyStyle.swift
//  
//
//  Created by Shahrukh Alam on 08/08/22.
//

import HTMLDSL

struct RootStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()
    
    var element: String
    
    init(page: Page, colorScheme: MediaStyle.ColorScheme, isApp: Bool) {
        let htmlColorScheme: HTMLDSL.ColorScheme = colorScheme == .light ? .light : .dark
        
        let htmlTagStyle = TagStyle(for: .enclosing(.html))
        var htmlStyle: CSSStyle
        
        switch page {
        case .home:
            htmlStyle = htmlTagStyle
                .home(colorScheme: htmlColorScheme)
        case .articleList:
            htmlStyle = htmlTagStyle
                .articlesList(colorScheme: htmlColorScheme)
        case .article, .about, .author:
            switch isApp {
            case false:
                htmlStyle = htmlTagStyle
                    .article(colorScheme: htmlColorScheme)
            case true:
                htmlStyle = htmlTagStyle
                    .articleLite(colorScheme: htmlColorScheme)
            }
        case ._404:
            htmlStyle = htmlTagStyle
                ._404(colorScheme: htmlColorScheme)
        }
        
        switch htmlColorScheme {
        case .light:
            htmlStyle = MediaStyle(for: colorScheme, with: htmlStyle)
        case .dark:
            break
        }
        
        self.element = htmlStyle.element
    }
}
