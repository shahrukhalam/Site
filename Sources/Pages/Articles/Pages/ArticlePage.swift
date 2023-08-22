//
//  ArticlePage.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import Modeling
import HTMLDSL

private var prismCSSLinks: some HTMLContentView {
    AnyView([
        CSSLink(path: "/css/prism-dark.css"),
        CSSLink(path: "/css/prism-light.css"),
        CSSLink(path: "/css/prism-override.css")
    ])
}

public func articlePage(tabs: [LinkDescription], selectedIndex: Int, article: Article, meta: MetaDetail, listImage: String, analyticsID: String, isApp: Bool) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                CSSLink(canonical: meta.canonicalURL)
                
                commonCSS(isApp: isApp)
                articlePageCSS(listImage: listImage)
                
                AnalyticsScript(id: analyticsID)
                prismCSSLinks
            }
            
            Body {
                if !isApp {
                    NavView(tabs: tabs, selectedIndex: selectedIndex)
                }
                
                ArticleView(article)
                Script(url: "/js/prism.js")
            }
        }
    }
}
