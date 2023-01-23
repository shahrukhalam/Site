//
//  ArticleListPage.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL
import Modeling

public func articleListPage(tabs: [LinkDescription], selectedIndex: Int, articles: [Article], meta: MetaDetail) -> some View {
    let cells = articles.enumerated().map { (index, article) in
        (index == articles.count - 1) ? AnyView(ArticleListCell(article: article)) : AnyView([
            AnyView(ArticleListCell(article: article)),
            AnyView(commonDivider)
        ])
    }

    let list = Div {
        AnyView(cells)
    }
        .identifyBy(cssClass: .articleList)

    return Document {
        HTML {
            Head {
                commonMeta(meta)
                commonCSSLinks
                commonCSS
                articleListPageCSS()
            }

            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                list
            }
        }
    }
}
