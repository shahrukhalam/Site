//
//  ArticlePage.swift
//
//
//  Created by Shahrukh Alam on 15/06/24.
//

import NotionParsing
import HTMLDSL
import Modeling
import Pages

public func articlePage(
    site: Site,
    tabs: [LinkDescription],
    selectedIndex: Int,
    page: NotionParsing.Page,
    meta: MetaDetail,
    analyticsID: String?,
    isApp: Bool
) throws -> some View {
    let articleView = try ArticleView(page)

    return Document {
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
                notionPageCSS()

                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
            }

            Body {
                if !isApp {
                    NavView(tabs: tabs, selectedIndex: selectedIndex)
                }

                articleView

                if case .ios = site {
                    Script(url: "/js/prism.js")
                }
            }
        }
    }
}
