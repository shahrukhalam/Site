import Modeling
import HTMLDSL

public func indexPage(
    tabs: [LinkDescription], 
    selectedIndex: Int, 
    promotions: [ImageDescription] = [], 
    sections: [Section],
    recentArticles: [Article] = [],
    popularArticles: [Article] = [],
    upcomingIOSEvents: [Event] = [],
    upcomingAndroidEvents: [Event] = [],
    upcomingAIEvents: [Event] = [],
    sponsor: HomeSponsor? = nil,
    collections: [Section] = [], 
    footer: Footer, 
    meta: MetaDetail, 
    analyticsID: String?
) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                
                commonCSS(page: .home, isApp: false)
                indexPageCSS
                homePageEnhancedCSS()
                
                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                
                indexContent(
                    promotions: promotions,
                    recentArticles: recentArticles,
                    popularArticles: popularArticles,
                    upcomingIOSEvents: upcomingIOSEvents,
                    upcomingAndroidEvents: upcomingAndroidEvents,
                    upcomingAIEvents: upcomingAIEvents,
                    sponsor: sponsor,
                    sections: sections
                )
                
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
                }
            }
            .identifyBy(cssClass: .footerFlexContainerX)
            .margin(
                left: .length(.relativeToRoot(Typography.Margin.body)),
                top: .length(.relativeToRoot(Typography.Margin.heading3)),
                right: .length(.relativeToRoot(Typography.Margin.body)),
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
                    .identifyBy(cssClass: .articleContainer)
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
                    .identifyBy(cssClass: .articleContainer)
                }
                .identifyBy(cssClass: .article)
                
                footerView(footer)
            }
        }
    }
}

public func authorsIndexPage(authors: [Author], tabs: [LinkDescription], selectedIndex: Int, footer: Footer, meta: MetaDetail, analyticsID: String?) -> some View {
    Document {
        HTML {
            Head {
                commonMeta(meta)
                
                commonCSSLinks
                
                commonCSS(page: .about, isApp: false)
                aboutPageCSS()
                authorsIndexPageCSS()
                
                if let analyticsID = analyticsID {
                    AnalyticsScript(id: analyticsID)
                }
            }
            
            Body {
                NavView(tabs: tabs, selectedIndex: selectedIndex)
                
                Div {
                    Div {
                        Headings("Our Authors", type: .h1)
                            .margin(bottom: .length(.relativeToRoot(Typography.Margin.heading2)))
                        
                        Paragraphs("Meet the talented authors behind SwiftPublished.com, sharing their expertise and passion for Swift and iOS development.")
                            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
                            .margin(bottom: .length(.relativeToRoot(Typography.Margin.heading1)))
                        
                        Div {
                            AnyView(authors.map { author in
                                authorCard(author)
                            })
                        }
                        .identifyBy(cssClass: .authorsGrid)
                    }
                    .identifyBy(cssClass: .articleContainer)
                }
                .identifyBy(cssClass: .article)
                
                footerView(footer)
            }
        }
    }
}

func authorCard(_ author: Author) -> some HTMLBodyContentView {
    let imageUrl: String
    switch author.id {
    case "aaina":
        imageUrl = "/images/about/aaina.jpg"
    case "murali":
        imageUrl = "/images/about/murali.jpg"
    case "shahrukh":
        imageUrl = "/images/about/shahrukh.jpeg"
    case "saba":
        imageUrl = "/images/about/saba.jpeg"
    default:
        imageUrl = "/images/index/apple-touch-icon.png"
    }
    
    return Div {
        Link(text: "", url: author.url)
            .identifyBy(cssClass: .authorCardLink)
        
        Div {
            Image(imageUrl, alternateText: author.detail.name)
                .size(width: .percentage(100))
                .identifyBy(cssClass: .authorCardImage)
        }
        .identifyBy(cssClass: .authorCardImageContainer)
        
        Div {
            Headings(author.detail.name, type: .h2)
                .identifyBy(cssClass: .authorCardName)
            
            Paragraphs(author.detail.role.description.capitalized)
                .identifyBy(cssClass: .authorCardRole)
        }
        .identifyBy(cssClass: .authorCardContent)
    }
    .identifyBy(cssClass: .authorCard)
}

func authorsIndexPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        RawCSSStyle(css: """
        .authorsGrid { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 2rem; margin-top: 2rem; }
        .authorCard { background: white; border-radius: 0.75rem; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.1); transition: transform 0.3s, box-shadow 0.3s; position: relative; }
        .authorCard:hover { transform: translateY(-4px); box-shadow: 0 4px 16px rgba(0,0,0,0.15); }
        .authorCardLink { position: absolute; top: 0; left: 0; right: 0; bottom: 0; text-decoration: none; color: inherit; z-index: 1; }
        .authorCardImageContainer { width: 100%; padding-top: 100%; position: relative; overflow: hidden; background: #f7fafc; }
        .authorCardImage { position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; }
        .authorCardContent { padding: 1.5rem; text-align: center; }
        .authorCardName { font-size: 1.25rem; margin-bottom: 0.5rem; color: #2d3748; }
        .authorCardRole { color: #718096; font-size: 0.9rem; }
        @media (max-width: 768px) { 
            .authorsGrid { grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 1.5rem; } 
        }
        """)
    }
}

public func authorsList(authors: [Subsection], tabs: [LinkDescription], selectedIndex: Int, footer: Footer, meta: MetaDetail, analyticsID: String?) -> some View {
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
                        Headings("Our Authors", type: .h1)
                        
                        Paragraphs("Meet the talented authors behind swiftpublished.in, sharing their expertise and passion for Swift and iOS development.")
                            .margin(
                                top: .length(.relativeToRoot(Typography.Margin.body)),
                                bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                            )
                        
                        Div {
                            Grid(model: authors)
                        }
                        .margin(
                            top: .length(.relativeToRoot(Typography.Margin.heading1)),
                            bottom: .length(.relativeToRoot(Typography.Margin.heading1))
                        )
                    }
                    .identifyBy(cssClass: .articleContainer)
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
                    .identifyBy(cssClass: .articleContainer)
                }
                .identifyBy(cssClass: .article)
                
                footerView(footer)
            }
        }
    }
}

// MARK: - Home Page Enhanced Sections

func indexContent(
    promotions: [ImageDescription],
    recentArticles: [Article],
    popularArticles: [Article],
    upcomingIOSEvents: [Event],
    upcomingAndroidEvents: [Event],
    upcomingAIEvents: [Event],
    sponsor: HomeSponsor?,
    sections: [Section]
) -> some HTMLBodyContentView {
    Div {
        for promotion in promotions {
            promotionView(promotion)
        }
        
        // Main container with sidebar layout
        Div {
            // Main content area
            Div {
                // Sections (tags) at the top
                for section in sections {
                    SectionView(section: section)
                }
                
                // Recent Articles - 3x2 grid (2 columns, 3 rows)
                if !recentArticles.isEmpty {
                    recentArticlesSection(recentArticles)
                }
                
                // Popular Articles - 3x2 grid (2 columns, 3 rows) below recent articles
                if !popularArticles.isEmpty {
                    popularArticlesSection(popularArticles)
                }
                
                if let sponsor = sponsor {
                    sponsorSection(sponsor)
                }
            }
            .identifyBy(cssClass: .mainContent)
            
            // Sidebar area
            Div {
                newsletterSignupView()
                
                if !upcomingIOSEvents.isEmpty {
                    upcomingEventsSection(title: "Upcoming iOS Events", events: upcomingIOSEvents)
                }
                
                if !upcomingAndroidEvents.isEmpty {
                    upcomingEventsSection(title: "Upcoming Android Events", events: upcomingAndroidEvents)
                }
                
                if !upcomingAIEvents.isEmpty {
                    upcomingEventsSection(title: "Upcoming AI Events", events: upcomingAIEvents)
                }
                
                homeTagsSection()
            }
            .identifyBy(cssClass: .sidebarContent)
        }
        .identifyBy(cssClass: .contentWithSidebar)
    }
    .identifyBy(cssClass: .indexContainer)
}

func newsletterSignupView() -> some HTMLBodyContentView {
    Div {
        Div {
            Headings("Subscribe to Our Newsletter", type: .h2)
                .margin(bottom: .length(.relativeToRoot(Typography.Margin.body)))
            
            Paragraphs("Get the latest Swift and iOS development articles delivered to your inbox. No spam, unsubscribe anytime.")
                .margin(bottom: .length(.relativeToRoot(Typography.Margin.heading3)))
            
            Link(text: "Subscribe to Newsletter →", url: "/subscribe")
                .identifyBy(cssClass: .newsletterButton)
                .padding(uniform: .length(.relativeToRoot(Typography.Margin.body)))
                .margin(top: .length(.relativeToRoot(Typography.Margin.body)))
            
            Paragraphs("Or follow us on RSS, Twitter, and LinkedIn for updates.")
                .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                .margin(top: .length(.relativeToRoot(Typography.Margin.body)))
        }
        .identifyBy(cssClass: .newsletterContent)
    }
    .identifyBy(cssClass: .newsletterSection)
}

func recentArticlesSection(_ articles: [Article]) -> some HTMLBodyContentView {
    Div {
        Headings("Recent Articles", type: .h2)
            .margin(bottom: .length(.relativeToRoot(Typography.Margin.heading3)))
        
        // Limit to 6 articles for 3x2 grid
        let limitedArticles = Array(articles.prefix(6))
        let cardViews = limitedArticles.map { article in
            AnyView(articleCard(article))
        }
        
        Div(AnyView(cardViews))
            .identifyBy(cssClass: .articlesGridTwoColumns)
    }
    .identifyBy(cssClass: .recentArticlesSection)
}

func popularArticlesSection(_ articles: [Article]) -> some HTMLBodyContentView {
    Div {
        Headings("Popular Articles", type: .h2)
            .margin(
                top: .length(.relativeToRoot(Typography.Margin.heading1)),
                bottom: .length(.relativeToRoot(Typography.Margin.heading3))
            )
        
        // Limit to 6 articles for 3x2 grid
        let limitedArticles = Array(articles.prefix(6))
        let cardViews = limitedArticles.map { article in
            AnyView(articleCard(article))
        }
        
        Div(AnyView(cardViews))
            .identifyBy(cssClass: .articlesGridTwoColumns)
    }
    .identifyBy(cssClass: .popularArticlesSection)
}

func articleCard(_ article: Article) -> some HTMLBodyContentView {
    Div {
        Link(text: "", url: article.relativeURL)
            .identifyBy(cssClass: .articleCardLink)
        
        Image(article.detail.banner.url, alternateText: article.detail.banner.description)
            .size(width: .percentage(100))
            .aspectRatio(width: 16, height: 9)
            .contentMode(.aspectFill)
            .identifyBy(cssClass: .articleCardImage)
        
        Div {
            Headings(article.detail.title, type: .h3)
                .identifyBy(cssClass: .articleCardTitle)
            
            Paragraphs(article.detail.intro)
                .identifyBy(cssClass: .articleCardIntro)
        }
        .identifyBy(cssClass: .articleCardContent)
    }
    .identifyBy(cssClass: .articleCard)
}

func upcomingEventsSection(title: String, events: [Event]) -> some HTMLBodyContentView {
    Div {
        Headings(title, type: .h2)
            .margin(bottom: .length(.relativeToRoot(Typography.Margin.heading3)))
        
        let eventViews = events.map { event in
            AnyView(eventCard(event))
        }
        
        Div(AnyView(eventViews))
            .identifyBy(cssClass: .eventsGrid)
    }
    .identifyBy(cssClass: .upcomingEventsSection)
}

func eventCard(_ event: Event) -> some HTMLBodyContentView {
    Div {
        Link(text: event.name, url: event.url)
            .identifyBy(cssClass: .eventCardLink)
        
        Headings(event.name, type: .h3)
            .identifyBy(cssClass: .eventCardTitle)
        
        Paragraphs("\(event.date) • \(event.location)")
            .identifyBy(cssClass: .eventCardMeta)
        
        Paragraphs(event.description)
            .identifyBy(cssClass: .eventCardDescription)
    }
    .identifyBy(cssClass: .eventCard)
}

func sponsorSection(_ sponsor: HomeSponsor) -> some HTMLBodyContentView {
    Div {
        Headings("Sponsored by", type: .h3)
            .margin(bottom: .length(.relativeToRoot(Typography.Margin.body)))
        
        Link(text: sponsor.name, url: sponsor.url)
            .identifyBy(cssClass: .sponsorLink)
        
        Image(sponsor.imageURL, alternateText: sponsor.name)
            .size(width: .pixel(200))
            .identifyBy(cssClass: .sponsorLogo)
        
        Paragraphs(sponsor.description)
            .identifyBy(cssClass: .sponsorDescription)
    }
    .identifyBy(cssClass: .sponsorSection)
}

func homeTagsSection() -> some HTMLBodyContentView {
    let popularTags = [
        ("Swift", "/articles/swift"),
        ("SwiftUI", "/articles/swiftui"),
        ("UIKit", "/articles/uikit"),
        ("Architecture", "/articles/architecture"),
        ("Testing", "/articles/testing"),
        ("SPM", "/articles/spm"),
        ("Interview", "/articles/interview"),
        ("AI", "/articles/AI")
    ]
    
    return Div {
        Headings("Popular Tags", type: .h2)
            .margin(bottom: .length(.relativeToRoot(Typography.Margin.heading3)))
        
        Div {
            AnyView(popularTags.map { (name, url) in
                AnyView(
                    Link(text: name, url: url)
                        .identifyBy(cssClass: .homeTagLink)
                )
            })
        }
        .identifyBy(cssClass: .homeTagsGrid)
    }
    .identifyBy(cssClass: .homeTagsSection)
}

func homePageEnhancedCSS() -> some HTMLHeadContentView {
    HeadStyle {
        RawCSSStyle(css: """
        /* Main layout with sidebar */
        .indexContainer { width: 100%; max-width: 100%; margin: 0; padding: 0; }
        .contentWithSidebar { display: flex; gap: 2rem; margin: 2rem auto; max-width: 1200px; padding: 0 1rem; flex-wrap: nowrap; }
        .mainContent { flex: 1 1 0; min-width: 0; max-width: calc(100% - 300px - 2rem); }
        .sidebarContent { flex: 0 0 300px; min-width: 300px; }
        
        /* Newsletter section */
        .newsletterSection { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 2rem 1.5rem; border-radius: 1rem; color: white; margin-top: 2rem; margin-bottom: 2rem; }
        .newsletterContent { text-align: center; }
        .newsletterSection h2 { color: white; margin-bottom: 1rem; font-size: 1.5rem; }
        .newsletterButton { display: inline-block; padding: 0.75rem 2rem; background: white; color: #667eea; border: none; border-radius: 0.5rem; font-weight: 600; cursor: pointer; transition: transform 0.2s; text-decoration: none; }
        .newsletterButton:hover { transform: translateY(-2px); }
        
        /* Sections alignment - align with newsletter top */
        .mainContent > .section:first-child { margin-top: 2rem; }
        .mainContent > .section:first-child h1 { margin-top: 0 !important; }
        
        /* Articles sections - 3x2 grid layout (2 columns, 3 rows) */
        .recentArticlesSection { margin-top: 2rem; }
        .popularArticlesSection { margin-top: 3rem; }
        .articlesGridTwoColumns { display: grid; grid-template-columns: repeat(2, 1fr); gap: 1.5rem; margin-top: 2rem; }
        .articlesGrid { display: grid; grid-template-columns: 1fr; gap: 1.5rem; margin-top: 2rem; }
        .articleCard { background: white; border-radius: 0.75rem; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.1); transition: transform 0.3s, box-shadow 0.3s; position: relative; }
        .articleCard:hover { transform: translateY(-4px); box-shadow: 0 4px 16px rgba(0,0,0,0.15); }
        .articleCardLink { position: absolute; top: 0; left: 0; right: 0; bottom: 0; text-decoration: none; color: inherit; z-index: 1; }
        .articleCardImage { border-radius: 0.75rem 0.75rem 0 0; width: 100%; }
        .articleCardContent { padding: 1.5rem; }
        .articleCardTitle { font-size: 1.25rem; margin-bottom: 0.5rem; color: #2d3748; }
        .articleCardIntro { color: #718096; font-size: 0.9rem; line-height: 1.5; }
        
        /* Events section */
        .upcomingEventsSection { background: #f7fafc; padding: 2rem 1.5rem; border-radius: 1rem; margin-top: 2rem; }
        .sidebarContent > .newsletterSection + .upcomingEventsSection { margin-top: 0; }
        .upcomingEventsSection h2 { font-size: 1.5rem; margin-bottom: 1rem; color: #2d3748; }
        .eventsGrid { display: flex; flex-direction: column; gap: 1rem; margin-top: 1rem; }
        .eventCard { background: white; padding: 1.25rem; border-radius: 0.75rem; border-left: 4px solid #667eea; transition: transform 0.2s; position: relative; }
        .eventCard:hover { transform: translateX(4px); }
        .eventCardLink { position: absolute; top: 0; left: 0; right: 0; bottom: 0; text-indent: -9999px; overflow: hidden; }
        .eventCardTitle { font-size: 1rem; color: #2d3748; margin-bottom: 0.5rem; }
        .eventCardMeta { color: #667eea; font-weight: 600; font-size: 0.85rem; margin-bottom: 0.5rem; }
        .eventCardDescription { color: #718096; font-size: 0.85rem; line-height: 1.4; }
        
        /* Dark mode support for events section */
        @media (prefers-color-scheme: dark) {
            .upcomingEventsSection { background: #1a1a1a; }
            .upcomingEventsSection h2 { color: #ffffff; }
            .eventCard { background: #2d2d2d; }
            .eventCardTitle { color: #ffffff; }
            .eventCardDescription { color: #b0b0b0; }
        }
        
        /* Sponsor section */
        .sponsorSection { margin: 3rem 0; padding: 2rem; border: 2px dashed #e2e8f0; border-radius: 1rem; text-align: center; }
        .sponsorLink { text-decoration: none; color: inherit; font-weight: 600; }
        .sponsorLogo { max-width: 200px; height: auto; margin: 1rem auto; display: block; }
        .sponsorDescription { color: #718096; max-width: 500px; margin: 1rem auto; }
        
        /* Tags section in sidebar */
        .homeTagsSection { background: white; padding: 1.5rem; border-radius: 1rem; box-shadow: 0 2px 8px rgba(0,0,0,0.1); margin-top: 2rem; }
        .homeTagsSection h2 { font-size: 1.25rem; margin-bottom: 1rem; color: #2d3748; }
        .homeTagsGrid { display: flex; flex-wrap: wrap; gap: 0.5rem; }
        .homeTagLink { display: inline-block; padding: 0.5rem 1rem; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; border-radius: 2rem; text-decoration: none; font-size: 0.85rem; font-weight: 500; transition: transform 0.2s, box-shadow 0.2s; }
        .homeTagLink:hover { transform: translateY(-2px); box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3); }
        
        /* Mobile responsive */
        @media (max-width: 1024px) {
            .contentWithSidebar { flex-direction: column; }
            .sidebarContent { flex: 1 1 100%; order: -1; }
            .mainContent { flex: 1 1 100%; }
            .articlesGridTwoColumns { grid-template-columns: 1fr; }
        }
        @media (max-width: 768px) { 
            .articlesGrid, .articlesGridTwoColumns { grid-template-columns: 1fr; } 
            .newsletterSection, .upcomingEventsSection { padding: 1.5rem 1rem; }
            .contentWithSidebar { gap: 1rem; margin: 1rem 0; }
        }
        """)
    }
}

// Helper struct for raw CSS
struct RawCSSStyle: CSSStyle {
    let css: String
    var key: CustomStringConvertible { "" }
    var styles: [Style] { [] }
    var element: String { css }
}
