public func articlePage(
    site: Site,
    tabs: [LinkDescription],
    selectedIndex: Int,
    page: NotionParsing.Page,
    meta: MetaDetail,
    htmlConfig: NotionHTML.Config,
    analyticsID: String?,
    isApp: Bool
) throws -> some View {
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

                ArticleView(page, meta: meta, htmlConfig: htmlConfig)

                if case .ios = site {
                    Script(url: "/js/prism.js")
                }
            }
        }
    }
}
