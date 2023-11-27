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
        
        let styles: [CSSStyle]
        switch mediaType {
        case .wide:
            let htmlStyle = TagStyle(for: .enclosing(.html))
                .sizeFull()
                .backgroundVariable(.article_list_background)
            
            let containerStyle = ClassStyle(forClass: .articleListContainer)
                .sizeFull()
                .scrollVertically()
            
            let articleListStyle = ClassStyle(forClass: .articleList)
                .size(width: .percentage(60))
                .margin(
                    left: .auto,
                    top: .length(.relativeToRoot(Typography.Margin.title)),
                    right: .auto,
                    bottom: .length(.relativeToRoot(Typography.Margin.title))
                )
                .padding(
                    top: .pixel(NavStyle.height)
                )
                .boxSize(.borderBox)
            
            styles = [htmlStyle, containerStyle, articleListStyle] + Self.cellStyle(mediaType)
        case .small:
            let articleListStyle = ClassStyle(forClass: .articleList)
                .size(width: .percentage(100))
                .margin(
                    top: .length(.relativeToRoot(Typography.Margin.title)),
                    bottom: .length(.relativeToRoot(Typography.Margin.title))
                )
                .padding(
                    left: .length(.relativeToRoot(Typography.Margin.body)),
                    top: .pixel(NavStyle.height),
                    right: .length(.relativeToRoot(Typography.Margin.body))
                )
            
            let articleListMediaStyle = MediaStyle(for: .small, with: articleListStyle)
            
            styles = [articleListMediaStyle] + Self.cellStyle(mediaType)
        }
        
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }

    static func cellStyle(_ mediaType: MediaStyle.DeviceType) -> [CSSStyle] {
        switch mediaType {
        case .wide:
            let gridStyle = ClassStyle(forClass: .gridContainerArticleList)
                .display(.grid)
                .gridNumberOfColumns(3)
                .gridColumn(
                    gap: .length(.relativeToRoot(Typography.Margin.title))
                )
                .margin(
                    bottom: .length(.relativeToRoot(Typography.Margin.title))
                )
                .padding(
                    uniform: .length(.relativeToRoot(Typography.Margin.heading3))
                )
                .backgroundVariable(.article_list_glass)
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
                .noOfLines(3)
                .margin(top: .length(.relativeToRoot(Typography.Margin.body)))
            
            let linkStyle = ClassStyle(forClass: .articleList, withTag: .enclosing(.link))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.heading2))
                .font(weight: .bold)
                .lineHeight(.number(Typography.LineHeight.heading))
                .foregroundVariable(.index_foreground)
                .textDecoration(.none)
            let linkHoverStyle = ClassStyle(.articleList, tag: .enclosing(.link), cssTag: .hover)
                .foregroundVariable(.index_foreground)
                .textDecoration(.underline)
            let codeStyle = ClassStyle(forClass: .articleList, withTag: .enclosing(.code))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.subheading))
                .padding(left: .pixel(6), top: .pixel(3), right: .pixel(6), bottom: .pixel(3))
                .backgroundVariable(.code_background)
                .foregroundVariable(.code_foreground)
                .cornerRadius(uniform: .pixel(3))
            
            let cellStyle = [gridStyle, gridItem1By3, gridItem2By3, descriptionStyle, linkStyle, linkHoverStyle, codeStyle]
            return cellStyle
        case .small:
            let gridStyle = ClassStyle(forClass: .gridContainerArticleList)
                .gridColumn(
                    gap: .length(.relativeToRoot(Typography.Margin.heading2))
                )
                .padding(
                    uniform: .length(.relativeToRoot(Typography.Margin.subheading))
                )
            let descriptionStyle = ClassStyle(forClass: .gridItem2By3ArticleList, withTag: .enclosing(.headings(.h4)))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                .noOfLines(4)
                .margin(top: .length(.relativeToRoot(Typography.Margin.byline)))
            
            let linkStyle = ClassStyle(forClass: .articleList, withTag: .enclosing(.link))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
                .lineHeight(.number(Typography.LineHeight.title))
            let codeStyle = ClassStyle(forClass: .articleList, withTag: .enclosing(.code))
                .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
            
            let cellStyle: CSSStyle = [gridStyle, descriptionStyle, linkStyle, codeStyle]
            return [MediaStyle(for: .small, with: cellStyle)]
        }
    }
}
