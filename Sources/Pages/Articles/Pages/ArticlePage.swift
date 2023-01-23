//
//  ArticlePage.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import Modeling
import HTMLDSL

public func articlePage(tabs: [LinkDescription], selectedIndex: Int, article: Article, meta: MetaDetail, listImage: String) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                commonCSSLinks
                commonCSS
                articlePageCSS(listImage: listImage)
                AnalyticsScript()
                CSSLink(path: "/css/prism-\(isDarkMode ? "dark" : "light").css")
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                ArticleView(article)
                Script(url: "/js/prism-\(isDarkMode ? "dark" : "light").js")
            }
        }
    }
}
