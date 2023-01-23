//
//  ArticleListStyle.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL

struct ArticleListStyle: CSSStyle {
    let key: CustomStringConvertible
    let styles = [Style]()

    let element: String

    init(_ mediaType: MediaStyle.DeviceType) {
        self.key = Tag.empty.description
        let containerStyle = ClassStyle(forClass: .articleList)
            .size(width: mediaType == .wide ? .percentage(48) : .percentage(90))
            .margin(left: .auto, right: .auto)
        let listStyle = MediaStyle(for: mediaType, with: containerStyle)

        let linkStyle = ClassStyle(forClass: .articleList, withTag: .enclosing(.link))
            .foregroundColor(isDarkMode ? Color.Dark.Foreground : Color.Light.Foreground)
            .textDecoration(.none)
        let linkHoverStyle = ClassStyle(.articleList, tag: .enclosing(.link), cssTag: .hover)
            .foregroundColor(isDarkMode ? Color.Dark.Foreground : Color.Light.Foreground)
            .textDecoration(.underline)
        let cellStyle = [linkStyle, linkHoverStyle]

        let styles: [CSSStyle] = [listStyle] + cellStyle
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
