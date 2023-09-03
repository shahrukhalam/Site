//
//  DarkIndexBodyStyle.swift
//  
//
//  Created by Shahrukh Alam on 08/08/22.
//

import HTMLDSL

enum Page {
    case home
    case articleList
    case article
    case about
    case author
    case _404
}

extension CSSStyle {
    func home(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .index(colorScheme: colorScheme)
            .navBar(colorScheme: colorScheme)
            .link(colorScheme: colorScheme)
    }
    
    private func index(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .variable(color: .index_background, scheme: colorScheme)
            .variable(color: .index_foreground, scheme: colorScheme)
    }
    
    private func link(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .variable(color: .link_foreground, scheme: colorScheme)
    }
    
    private func navBar(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .variable(color: .nav_bar_background, scheme: colorScheme)
            .variable(color: .nav_bar_active_item, scheme: colorScheme)
            .variable(color: .nav_bar_inactive_item, scheme: colorScheme)
            .variable(color: .nav_bar_hover_item, scheme: colorScheme)
            .variable(color: .nav_bar_divider, scheme: colorScheme)
    }
    
    func articlesList(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .index(colorScheme: colorScheme)
            .navBar(colorScheme: colorScheme)
            .code(colorScheme: colorScheme)
            .variable(color: .article_list_glass, scheme: colorScheme)
            .variable(color: .article_list_background, scheme: colorScheme)
    }
    
    func article(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .articleLite(colorScheme: colorScheme)
            .navBar(colorScheme: colorScheme)
    }
    
    func articleLite(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .index(colorScheme: colorScheme)
            .link(colorScheme: colorScheme)
            .code(colorScheme: colorScheme)
            .variable(color: .code_block_background, scheme: colorScheme)
            .variable(color: .code_block_type, scheme: colorScheme)
            .variable(color: .code_block_keyword, scheme: colorScheme)
            .variable(color: .code_block_string, scheme: colorScheme)
            .variable(color: .code_block_number, scheme: colorScheme)
            .variable(color: .note_background, scheme: colorScheme)
            .variable(color: .note_border, scheme: colorScheme)
            .variable(color: .warning_background, scheme: colorScheme)
            .variable(color: .warning_border, scheme: colorScheme)
            .variable(color: .important_background, scheme: colorScheme)
            .variable(color: .important_border, scheme: colorScheme)
            .variable(color: .tip_background, scheme: colorScheme)
            .variable(color: .tip_border, scheme: colorScheme)
    }
    
    private func code(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .variable(color: .code_background, scheme: colorScheme)
            .variable(color: .code_foreground, scheme: colorScheme)
    }
    
    func _404(colorScheme: HTMLDSL.ColorScheme) -> CSSStyle {
        self
            .index(colorScheme: colorScheme)
            .navBar(colorScheme: colorScheme)
            .variable(color: .background_404, scheme: colorScheme)
            .variable(color: .title_404, scheme: colorScheme)
            .variable(color: .subtitle_404, scheme: colorScheme)
    }
}

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

struct BodyStyle: CSSStyle {
    let key: CustomStringConvertible = Tag.empty.description
    let styles = [Style]()
    
    var element: String
    
    init(isApp: Bool) {
        let bodyStyle = TagStyle(for: .enclosing(.body))
            .backgroundVariable(.index_background)
            .foregroundVariable(.index_foreground)
            .padding(top: isApp ? .pixel(0) : .pixel(57))
            .font(family: .apple([.notion]))
        self.element = bodyStyle.element
    }
}
