//
//  ArticleListPageCSS.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL

func articleListPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        ArticleListStyle(.small)
        ArticleListStyle(.wide)
    }
}
