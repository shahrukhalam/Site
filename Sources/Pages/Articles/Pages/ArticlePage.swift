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
        /// Loading CSS based on any `media` query expression
        /// seems to be out of specification for the media attribute.
        /// https://www.w3schools.com/tags/att_link_media.asp
        CSSLink(path: "/css/prism-dark.css"),
        CSSLink(path: "/css/prism-light.css"),
        CSSLink(path: "/css/prism-override.css")
    ])
}

public func articlePage(tabs: [LinkDescription], selectedIndex: Int, article: Article, meta: MetaDetail, listImage: String, analyticsID: String?, isApp: Bool) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta, isApp: isApp)
                
                commonCSSLinks
                prismCSSLinks
                
                commonCSS(page: .article, isApp: isApp)
                "<base target=\"_blank\">"
                articlePageCSS(listImage: listImage)
                
                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
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
