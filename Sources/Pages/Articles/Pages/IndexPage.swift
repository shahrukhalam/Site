import Modeling
import HTMLDSL

public func indexPage(tabs: [LinkDescription], selectedIndex: Int, sections: [Section], collection: Section, meta: MetaDetail, analyticsID: String) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)

                commonCSSLinks
                CSSLink(canonical: meta.canonicalURL)

                commonCSS
                indexPageCSS

                AnalyticsScript(id: analyticsID)
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

public func about(markdown: String, tabs: [LinkDescription], selectedIndex: Int, meta: MetaDetail, analyticsID: String) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                CSSLink(canonical: meta.canonicalURL)
                
                commonCSS
                articlePageCSS(listImage: "")
                
                AnalyticsScript(id: analyticsID)
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
