//
//  ArticleListPageCSS.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL

func articleListPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        MediaStyle(for: .wide, with: ArticleListStyle(.wide))
        MediaStyle(for: .small, with: ArticleListStyle(.small))
    }
}
