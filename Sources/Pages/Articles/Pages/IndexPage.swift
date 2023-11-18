import Modeling
import HTMLDSL

public func indexPage(tabs: [LinkDescription], selectedIndex: Int, sections: [Section], collection: Section, meta: MetaDetail, analyticsID: String?) -> some View {
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
                    promotion()
                    
                    for section in sections {
                        SectionView(section: section)
                    }
                }
                .identifyBy(cssClass: .indexContainer)
                
                footer()
            }
        }
    }
}

func promotion() -> some HTMLContentView {
    Image("/images/promotion/diwali.gif", alternateText: "Happy Diwali")
        .size(width: .percentage(100))
        .cornerRadius(.length(.relativeToRoot(Typography.Margin.body)))
        .border(sides: [.top, .right], color: .variable(CSSVariable.nav_bar_divider.name))
}

func footer() -> some HTMLContentView {
    Div {
        Div {
            Div {
                Div {
                    Paragraphs("Content")
                        .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                        .font(weight: .number(600))
                    Link(text: "Home", url: "/")
                        .identifyBy(cssClass: .footerLink)
                    Link(text: "Articles", url: "/articles")
                        .identifyBy(cssClass: .footerLink)
                }
                .identifyBy(cssClass: .footerFlexContainerY)
                .margin(
                    left: .length(.relativeToRoot(Typography.Margin.body))
                )
                
                Div {
                    Paragraphs("More")
                        .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                        .font(weight: .number(600))
                    Link(text: "About", url: "/about")
                        .identifyBy(cssClass: .footerLink)
                    Link(text: "Support", url: "/support")
                        .identifyBy(cssClass: .footerLink)
                    Link(text: "Privacy", url: "/privacy/app")
                        .identifyBy(cssClass: .footerLink)
                }
                .identifyBy(cssClass: .footerFlexContainerY)
                .margin(
                    right: .length(.relativeToRoot(Typography.Margin.body))
                )
            }
            .identifyBy(cssClass: .footerFlexContainerX)
            .margin(
                top: .length(.relativeToRoot(Typography.Margin.heading3)),
                bottom: .length(.relativeToRoot(Typography.Margin.body))
            )
            
            commonDivider
            
            Div {
                Paragraphs("Copyright © 2023 Swift Published. All rights reserved.")
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

public func about(markdown: String, authors: [Subsection], tabs: [LinkDescription], selectedIndex: Int, meta: MetaDetail, analyticsID: String?) -> some View {
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
                
                footer()
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
                
                footer()
            }
        }
    }
}

public func support(markdown: String, tabs: [LinkDescription], selectedIndex: Int, meta: MetaDetail, analyticsID: String?) -> some View {
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
                
                footer()
            }
        }
    }
}
