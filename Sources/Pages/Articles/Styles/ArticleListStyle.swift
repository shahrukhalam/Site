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
            .size(width: mediaType == .wide ? .percentage(60) : .percentage(90))
            .margin(left: .auto, top: .pixel(60), right: .auto, bottom: .pixel(60))
        let listStyle = MediaStyle(for: mediaType, with: containerStyle)

        let gridStyle = ClassStyle(forClass: .gridContainer)
            .display(.grid)
            .gridNumberOfColumns(3)
            .gridColumn(gap: 48)
        let gridItem1By3 = ClassStyle(forClass: .gridItem1By3)
            .gridColumn(location: 1, size: 2)
        let gridItem2By3 = ClassStyle(forClass: .gridItem2By3)
            .gridColumn(location: 2, size: 4)
            .lineHeight(.number(Typography.LineHeight.small))

        let linkStyle = ClassStyle(forClass: .articleList, withTag: .enclosing(.link))
            .foregroundColor(isDarkMode ? Color.Dark.Foreground : Color.Light.Foreground)
            .textDecoration(.none)
        let linkHoverStyle = ClassStyle(.articleList, tag: .enclosing(.link), cssTag: .hover)
            .foregroundColor(isDarkMode ? Color.Dark.Foreground : Color.Light.Foreground)
            .textDecoration(.underline)
        let cellStyle = [gridStyle, gridItem1By3, gridItem2By3, linkStyle, linkHoverStyle]

        let styles: [CSSStyle] = [listStyle] + cellStyle
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
