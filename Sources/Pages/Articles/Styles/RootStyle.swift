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
    
    init() {
        let htmlStyle = TagStyle(for: .enclosing(.html))
            .variable(color: .index_background, scheme: .dark)
            .variable(color: .index_foreground, scheme: .dark)
            .variable(color: .nav_bar_background, scheme: .dark)
            .variable(color: .nav_bar_active_item, scheme: .dark)
            .variable(color: .nav_bar_inactive_item, scheme: .dark)
            .variable(color: .nav_bar_hover_item, scheme: .dark)
            .variable(color: .nav_bar_divider, scheme: .dark)
            .font(family: .apple([.notion]))
        let bodyStyle = TagStyle(for: .enclosing(.body))
            .backgroundColor(variable: .index_background)
            .foregroundColor(variable: .index_foreground)
            .padding(top: .pixel(57))
        let styles = [htmlStyle, bodyStyle]
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }

    init(_ mediaType: MediaStyle.DeviceType) {
        let htmlStyle = TagStyle(for: .enclosing(.html))
            .font(size: mediaType == .wide ? .pixel(16) : .pixel(14))
        
        self.element = htmlStyle.element
    }
    
    init(_ colorScheme: MediaStyle.ColorScheme) {
        let colorSchemeConverted: HTMLDSL.ColorScheme = colorScheme == .light ? .light : .dark
        let htmlColorSchemeStyle = TagStyle(for: .enclosing(.html))
            .variable(color: .index_background, scheme: colorSchemeConverted)
            .variable(color: .index_foreground, scheme: colorSchemeConverted)
            .variable(color: .nav_bar_background, scheme: colorSchemeConverted)
            .variable(color: .nav_bar_active_item, scheme: colorSchemeConverted)
            .variable(color: .nav_bar_inactive_item, scheme: colorSchemeConverted)
            .variable(color: .nav_bar_hover_item, scheme: colorSchemeConverted)
            .variable(color: .nav_bar_divider, scheme: colorSchemeConverted)
        let htmlColorSchemeMediaStyle = MediaStyle(for: colorScheme, with: htmlColorSchemeStyle)

        self.element = htmlColorSchemeMediaStyle.element
    }
}
