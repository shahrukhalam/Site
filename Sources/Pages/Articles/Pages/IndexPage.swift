import Modeling
import HTMLDSL

public func indexPage(tabs: [LinkDescription], selectedIndex: Int, promotions: [ImageDescription] = [], sections: [Section], collections: [Section] = [], footer: Footer, meta: MetaDetail, analyticsID: String?) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                
                commonCSS(page: .home, isApp: false)
                indexPageCSS
                
                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                
                Div {
                    for promotion in promotions {
                        promotionView(promotion)
                    }
                    
                    for section in sections {
                        SectionView(section: section)
                    }
                }
                .identifyBy(cssClass: .indexContainer)
                
                footerView(footer)
            }
        }
    }
}

func promotionView(_ image: ImageDescription) -> AnyView {
    AnyView(
        Image(image.url, alternateText: image.description)
            .size(width: .percentage(100))
            .cornerRadius(.length(.relativeToRoot(Typography.Margin.body)))
            .border(sides: [.top, .right], color: .variable(CSSVariable.nav_bar_divider.name))
    )
}

func footerView(_ footer: Footer) -> some HTMLContentView {
    Div {
        Div {
            Div {
                for section in footer.sections {
                    Div {
                        Paragraphs(section.name)
                            .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                            .font(weight: .number(600))
                        for subsection in section.subsections {
                            Link(text: subsection.text, url: subsection.url)
                                .identifyBy(cssClass: .footerLink)
                        }
                    }
                    .identifyBy(cssClass: .footerFlexContainerY)
                    .margin(
                        left: .length(.relativeToRoot(Typography.Margin.body))
                    )
                }
            }
            .identifyBy(cssClass: .footerFlexContainerX)
            .margin(
                top: .length(.relativeToRoot(Typography.Margin.heading3)),
                bottom: .length(.relativeToRoot(Typography.Margin.body))
            )
            
            commonDivider
            
            Div {
                Paragraphs(footer.copyright)
                    .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
            }
            .identifyBy(cssClass: .footerFlexContainerX)
            .margin(
                left: .length(.relativeToRoot(Typography.Margin.body)),
                top: .length(.relativeToRoot(Typography.Margin.body)),
                right: .length(.relativeToRoot(Typography.Margin.body)),
                bottom: .length(.relativeToRoot(Typography.Margin.heading3))
            )
        }
        .identifyBy(cssClass: .footerFlexOuterContainerY)
    }
    .identifyBy(cssClass: .footerContainer)
}

public func about(markdown: String, authors: [Subsection], tabs: [LinkDescription], selectedIndex: Int, footer: Footer, meta: MetaDetail, analyticsID: String?) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                
                commonCSS(page: .about, isApp: false)
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
                
                footerView(footer)
            }
        }
    }
}

public func author(markdown: String, tabs: [LinkDescription], selectedIndex: Int, footer: Footer, meta: MetaDetail, analyticsID: String?) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                
                commonCSS(page: .author, isApp: false)
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
                
                footerView(footer)
            }
        }
    }
}

public func support(markdown: String, tabs: [LinkDescription], selectedIndex: Int, footer: Footer, meta: MetaDetail, analyticsID: String?) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                
                commonCSS(page: .about, isApp: false)
                supportPageCSS()
                
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
                
                footerView(footer)
            }
        }
    }
}
