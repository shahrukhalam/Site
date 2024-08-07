//
//  ArticlePageCSS.swift
//  
//
//  Created by Shahrukh Alam on 25/09/2022.
//

import HTMLDSL

public func articlePageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        ArticleStyle()
        
        /// the order is important
        /// `wide` first, then `small`
        articleContainerStyle(.wide)
        articleContainerStyle(.small)

        bylineStyle

        /// the order is important
        /// `wide` first, then `small`
        MarkdownStyle(.wide)
        MarkdownStyle(.small)

        shareStyle
        commentBoxDisclosureStyle

        /// the order is important
        /// `wide` first, then `small`
        ArticleListStyle.cellStyle(.wide)
        ArticleListStyle.cellStyle(.small)
    }
}

public var openLinkInNewTabCSS: some HTMLHeadContentView {
    AnyView("<base target=\"_blank\">")
}

func aboutPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        /// the order is important
        /// `wide` first, then `small`
        gridContainerStyleIndex
        MediaStyle(for: .small, with: gridContainerSmallStyleIndex)

        ArticleStyle()

        /// the order is important
        /// `wide` first, then `small`
        articleContainerStyle(.wide)
        articleContainerStyle(.small)
        /// the order is important
        /// `wide` first, then `small`
        MarkdownStyle(.wide)
        MarkdownStyle(.small)
    }
}

func supportPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        ArticleStyle()

        /// the order is important
        /// `wide` first, then `small`
        articleContainerStyle(.wide)
        articleContainerStyle(.small)
        /// the order is important
        /// `wide` first, then `small`
        MarkdownStyle(.wide)
        MarkdownStyle(.small)
    }
}

func authorPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        ArticleStyle()

        /// the order is important
        /// `wide` first, then `small`
        articleContainerStyle(.wide)
        articleContainerStyle(.small)
        /// the order is important
        /// `wide` first, then `small`
        MarkdownStyle(.wide)
        MarkdownStyle(.small)
    }
}
