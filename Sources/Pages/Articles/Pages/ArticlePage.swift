//
//  ArticlePage.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import Modeling
import HTMLDSL

private var prismCSSLinks: some HTMLHeadContentView {
    AnyView([
        /// Loading CSS based on any `media` query expression
        /// seems to be out of specification for the media attribute.
        /// https://www.w3schools.com/tags/att_link_media.asp
        CSSLink(path: "/css/prism-dark.css"),
        CSSLink(path: "/css/prism-light.css"),
        CSSLink(path: "/css/prism-override.css")
    ])
}

public func articlePage(site: Site, tabs: [LinkDescription], selectedIndex: Int, article: Article, meta: MetaDetail, analyticsID: String?, isApp: Bool) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta, isApp: isApp)
                
                commonCSSLinks
                
                if case .ios = site {
                    prismCSSLinks
                }
                
                commonCSS(page: .article, isApp: isApp)
                if !isApp {
                    openLinkInNewTabCSS
                }
                articlePageCSS()
                
                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
            }
            
            Body {
                if !isApp {
                    NavView(tabs: tabs, selectedIndex: selectedIndex)
                }
                
                ArticleView(article)
                
                if case .ios = site {
                    Script(url: "/js/prism.js")
                }
            }
        }
    }
}
