//
//  ArticleListPage.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL
import Modeling

public func articleListPage(tabs: [LinkDescription], selectedIndex: Int, articles: [Article], meta: MetaDetail, analyticsID: String?) -> some View {
    let cells = articles.enumerated().map { (index, article) in
        (index == articles.count - 1) ? AnyView(ArticleListCell(article: article)) : AnyView([
            AnyView(ArticleListCell(article: article)),
            //            AnyView(commonDivider)
        ])
    }
    
    let list = Div {
        Div {
            AnyView(cells)
        }
        .identifyBy(cssClass: .articleList)
    }
        .identifyBy(cssClass: .articleListContainer)

    return Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                
                commonCSS(page: .articleList, isApp: false)
                articleListPageCSS()
                
                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
            }

            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                list
            }
            .padding(uniform: .pixel(0))
            .sizeFull()
            .backgroundColor(.transparent)
        }
    }
}
