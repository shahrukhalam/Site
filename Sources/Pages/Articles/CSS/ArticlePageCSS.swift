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
        markdownContainerStyle(.wide)
        markdownContainerStyle(.small)

        bylineStyle

        MarkdownStyle(.wide)
        MarkdownStyle(.small)

        shareStyle
        commentBoxDisclosureStyle

        ArticleListStyle.cellStyle(.wide)
        ArticleListStyle.cellStyle(.small)
    }
}

func aboutPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        MediaStyle(for: .wide, with: gridContainerStyleIndex)
        MediaStyle(for: .small, with: gridContainerSmallStyleIndex)

        ArticleStyle()

        markdownContainerStyle(.small)
        markdownContainerStyle(.wide)
        MediaStyle(for: .wide, with: MarkdownStyle(.wide))
        MediaStyle(for: .small, with: MarkdownStyle(.small))
    }
}

func authorPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        ArticleStyle()

        markdownContainerStyle(.small)
        markdownContainerStyle(.wide)
        MediaStyle(for: .wide, with: MarkdownStyle(.wide))
        MediaStyle(for: .small, with: MarkdownStyle(.small))
    }
}
