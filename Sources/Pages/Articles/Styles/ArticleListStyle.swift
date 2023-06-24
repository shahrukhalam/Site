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
            .lineHeight(.number(Typography.LineHeight.body))
        let descriptionStyle = ClassStyle(forClass: .gridItem2By3, withTag: .enclosing(.headings(.h4)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .font(weight: .normal)
            .lineHeight(.number(Typography.LineHeight.title2))
            .foregroundColor(.Light.ArticleText)
            .noOfLines(3)

        let linkStyle = ClassStyle(forClass: .articleList, withTag: .enclosing(.link))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.title3))
            .font(weight: .bold)
            .lineHeight(.number(Typography.LineHeight.title1))
            .foregroundColor(.Light.ArticleText)
            .textDecoration(.none)
        let linkHoverStyle = ClassStyle(.articleList, tag: .enclosing(.link), cssTag: .hover)
            .foregroundColor(.Light.ArticleText)
            .textDecoration(.underline)
        let cellStyle = [gridStyle, gridItem1By3, gridItem2By3, descriptionStyle, linkStyle, linkHoverStyle]

        let styles: [CSSStyle] = [listStyle] + cellStyle
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
