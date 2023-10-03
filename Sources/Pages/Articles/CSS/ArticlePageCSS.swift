//
//  ArticlePageCSS.swift
//  
//
//  Created by Shahrukh Alam on 25/09/2022.
//

import HTMLDSL

func articlePageCSS(listImage: String) -> some HTMLHeadContentView {
    HeadStyle {
        ArticleStyle()
        
        /// the order is important
        /// `wide` first, then `small`
        markdownContainerStyle(.wide)
        markdownContainerStyle(.small)

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

var openLinkInNewTabCSS: some HTMLHeadContentView {
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
        markdownContainerStyle(.wide)
        markdownContainerStyle(.small)
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
        markdownContainerStyle(.wide)
        markdownContainerStyle(.small)
        /// the order is important
        /// `wide` first, then `small`
        MarkdownStyle(.wide)
        MarkdownStyle(.small)
    }
}
