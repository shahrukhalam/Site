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
            .margin(
                top: .length(.relativeToRoot(Typography.Margin.title)),
                bottom: .length(.relativeToRoot(Typography.Margin.title))
            )
            .padding(
                bottom: .length(.relativeToRoot(Typography.Margin.heading1))
            )
            /// To make footer stay at the bottom
            /// https://philipwalton.github.io/solved-by-flexbox/demos/sticky-footer/
            .flex(value: 1)
        self.element = articleStyle.element
    }
}

private let bylineContainerStyle = ClassStyle(forClass: .markdown, withClass: .bylineContainer)
    .display(.flex)
    .flexWrap()
    .flex(columnGap: .length(.relativeToRoot(Typography.Margin.subheading)))
    .flex(rowGap: .length(.relativeToRoot(Typography.Margin.byline)))

private let bylineParagraphStyle = ClassStyle(forClass: .markdown, withClass: .bylineParagraph)
        .foregroundVariable(.nav_bar_active_item)

private let bylineItemStyle = ClassStyle(forClass: .bylineItem)
public let bylineStyle: [CSSStyle] = [bylineContainerStyle, bylineParagraphStyle]
