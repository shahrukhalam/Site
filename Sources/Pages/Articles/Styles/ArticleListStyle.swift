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
        
        let htmlStyle = TagStyle(for: .enclosing(.html))
            .sizeFull()
            .backgroundColor(.Light.ArticleListBackgroundColor)

        let containerStyle = ClassStyle(forClass: .articleListContainer)
            .sizeFull()
            .scrollVertically()
        
        let articleListStyle = ClassStyle(forClass: .articleList)
            .size(width: mediaType == .wide ? .percentage(60) : .percentage(100))
            .margin(
                left: mediaType == .wide ? .auto : .pixel(0),
                top: .length(.relativeToRoot(Typography.Margin.title)),
                right: mediaType == .wide ? .auto : .pixel(0),
                bottom: .length(.relativeToRoot(Typography.Margin.title))
            )
        // TODO: Hacky way as now body is 100% height for article list page
            .padding(
                left: mediaType == .wide ? .pixel(0) : .length(.relativeToRoot(Typography.Margin.body)),
                top: .pixel(57),
                right: mediaType == .wide ? .pixel(0) : .length(.relativeToRoot(Typography.Margin.body))
            )
            .boxSize(.borderBox)

        let styles: [CSSStyle] = [htmlStyle, containerStyle, articleListStyle] + Self.cellStyle(mediaType)
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }

    static func cellStyle(_ mediaType: MediaStyle.DeviceType) -> [CSSStyle] {
        let gridStyle = ClassStyle(forClass: .gridContainerArticleList)
            .display(.grid)
            .gridNumberOfColumns(3)
            .gridColumn(
                gap: mediaType == .wide ?
                    .length(.relativeToRoot(Typography.Margin.title)) : .length(.relativeToRoot(Typography.Margin.heading2))
            )
            .margin(
                bottom: .length(.relativeToRoot(Typography.Margin.title))
            )
            .padding(
                uniform: mediaType == .wide ?
                    .length(.relativeToRoot(Typography.Margin.heading3)) :
                        .length(.relativeToRoot(Typography.Margin.subheading))
            )
            .backgroundColor(variable: .article_list_glass)
            .filter(saturationInPercentage: 180, blurInPixel: 20)
            .cornerRadius(uniform: .pixel(8))
        let gridItem1By3 = ClassStyle(forClass: .gridItem1By3ArticleList)
            .gridColumn(location: 1, size: 2)
        let gridItem2By3 = ClassStyle(forClass: .gridItem2By3ArticleList)
            .gridColumn(location: 2, size: 4)
            .lineHeight(.number(Typography.LineHeight.body))
        let descriptionStyle = ClassStyle(forClass: .gridItem2By3ArticleList, withTag: .enclosing(.headings(.h4)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .font(weight: .normal)
            .lineHeight(.number(Typography.LineHeight.subheading))
            .noOfLines(mediaType == .wide ? 3 : 4)

        let linkStyle = ClassStyle(forClass: .articleList, withTag: .enclosing(.link))
            .font(size: mediaType == .wide ? .relativeToRootFontSize(Typography.Font.Size.heading2) : .relativeToRootFontSize(Typography.Font.Size.subheading))
            .font(weight: .bold)
            .lineHeight(.number(Typography.LineHeight.heading))
            .foregroundColor(variable: .index_foreground)
            .textDecoration(.none)
        let linkHoverStyle = ClassStyle(.articleList, tag: .enclosing(.link), cssTag: .hover)
            .foregroundColor(variable: .index_foreground)
            .textDecoration(.underline)
        let codeStyle = ClassStyle(forClass: .articleList, withTag: .enclosing(.code))
            .padding(left: .pixel(6), top: .pixel(3), right: .pixel(6), bottom: .pixel(3))
            .backgroundColor(.Light.ArticleNoteBackground)
            .foregroundColor(.Light.ArticleWarningBorder)
            .cornerRadius(uniform: .pixel(3))
        let cellStyle = [gridStyle, gridItem1By3, gridItem2By3, descriptionStyle, linkStyle, linkHoverStyle, codeStyle]
        return cellStyle
    }
}
