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
        markdownContainerStyle(.small)
        markdownContainerStyle(.wide)
        MarkdownStyle(listImage: listImage)
        shareStyle
    }
}
