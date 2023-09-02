import Modeling
import HTMLDSL

public func indexPage(tabs: [LinkDescription], selectedIndex: Int, sections: [Section], collection: Section, meta: MetaDetail, analyticsID: String?) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)

                commonCSSLinks
                CSSLink(canonical: meta.canonicalURL)

                commonCSS(isApp: false)
                indexPageCSS

                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                
                Div {
                    for section in sections {
                        SectionView(section: section)
                    }

//                    Div {
//                        Headings(collection.description.title, type: .h1)
//                            .font(size: .relativeToRootFontSize(Typography.Font.Size.heading2))
//                            .margin(
//                                top: .length(.relativeToRoot(Typography.Margin.title)),
//                                bottom: .length(.relativeToRoot(Typography.Margin.heading3))
//                            )
//                        Grid(model: collection.subsections)
//                    }
                }
                .identifyBy(cssClass: .indexContainer)
            }
        }
    }
}

public func about(markdown: String, authors: [Subsection], tabs: [LinkDescription], selectedIndex: Int, meta: MetaDetail, analyticsID: String?) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                CSSLink(canonical: meta.canonicalURL)
                
                commonCSS(isApp: false)
                aboutPageCSS()
                
                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                
                Div {
                    Div {
                        if let markdown0 = markdown.components(separatedBy: "fire_in_the_hole_authors").first {
                            Markdown(markdown0)
                                .identifyBy(cssClass: .markdown)
                        }

                        Div {
                            Grid(model: authors)
                        }
                        .margin(
                            top: .length(.relativeToRoot(Typography.Margin.heading1)),
                            bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                        )

                        if let markdown1 = markdown.components(separatedBy: "fire_in_the_hole_authors").last {
                            Markdown(markdown1)
                                .identifyBy(cssClass: .markdown)
                        }
                    }
                    .identifyBy(cssClass: .markdownContainer)
                }
                .identifyBy(cssClass: .article)
            }
        }
    }
}

public func author(markdown: String, tabs: [LinkDescription], selectedIndex: Int, meta: MetaDetail, analyticsID: String?) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)

                commonCSSLinks
                CSSLink(canonical: meta.canonicalURL)

                commonCSS(isApp: false)
                aboutPageCSS()

                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
            }

            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)

                Div {
                    Div {
                        Markdown(markdown)
                            .identifyBy(cssClass: .markdown)
                    }
                    .identifyBy(cssClass: .markdownContainer)
                }
                .identifyBy(cssClass: .article)
            }
        }
    }
}
