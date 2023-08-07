//
//  CSSClass + Extension.swift
//  
//
//  Created by Shahrukh Alam on 04/01/2023.
//

import HTMLDSL

extension CSSClass {
    // MARK: Common
    static var largeTitle: Self { .init(stringLiteral: #function) }

    static var title1: Self { .init(stringLiteral: #function) }
    static var title2: Self { .init(stringLiteral: #function) }
    static var title3: Self { .init(stringLiteral: #function) }
    static var headline: Self { .init(stringLiteral: #function) }
    static var body: Self { .init(stringLiteral: #function) }
    static var callout: Self { .init(stringLiteral: #function) }
    static var subheadline: Self { .init(stringLiteral: #function) }

    static var centerText: Self { .init(stringLiteral: #function) }
    static var centerDivContainerX: Self { .init(stringLiteral: #function) }
    /// Puts `Div` in a vertical stack, `center` aligned in Y, `left` distributed in X
    static var centerDivContainerY: Self { .init(stringLiteral: #function) }
    static var centerDivContainer: Self { .init(stringLiteral: #function) }
    static var imageFullWidth: Self { .init(stringLiteral: #function) }
    static var imageHalfWidth: Self { .init(stringLiteral: #function) }

    static var desktopHidden: Self { .init(stringLiteral: #function) }
    static var mobileHidden: Self { .init(stringLiteral: #function) }

    // MARK: New Index
    static var indexNav: Self { .init(stringLiteral: #function) }
    static var activeLink: Self { .init(stringLiteral: #function) }
    static var inactiveLink: Self { .init(stringLiteral: #function) }

    static var sectionHeader: Self { .init(stringLiteral: #function) }
    static var sectionHeaderContent: Self { .init(stringLiteral: #function) }
    static var sectionHeaderHero: Self { .init(stringLiteral: #function) }
    static var link: Self { .init(stringLiteral: #function) }

    static var indexContainer: Self { .init(stringLiteral: #function) }
    static var pillLink: Self { .init(stringLiteral: #function) }
    static var section: Self { .init(stringLiteral: #function) }
    static var collectionDescription: Self { .init(stringLiteral: #function) }
    
    // Grid
    static var gridContainerIndex: Self { .init(stringLiteral: #function) }
    static var gridItemIndex: Self { .init(stringLiteral: #function) }
    static var gridItemHeroIndex: Self { .init(stringLiteral: #function) }

    // MARK: Article
    static var article: Self { .init(stringLiteral: #function) }
    static var markdownContainer: Self { .init(stringLiteral: #function) }
    static var markdown: Self { .init(stringLiteral: #function) }
    static var intro: Self { .init(stringLiteral: #function) }
    static var imageCredits: Self { .init(stringLiteral: #function) }
    static var share: Self { .init(stringLiteral: #function) }
    
    static var pullQuote: Self { .init(stringLiteral: #function) }
    static var pullQuoteAttribution: Self { .init(stringLiteral: #function) }
    static var pullQuoteContainer: Self { .init(stringLiteral: #function) }
    static var note: Self { .init(stringLiteral: #function) }
    static var noteContainer: Self { .init(stringLiteral: #function) }
    static var warning: Self { .init(stringLiteral: #function) }
    static var warningContainer: Self { .init(stringLiteral: #function) }
    static var important: Self { .init(stringLiteral: #function) }
    static var importantContainer: Self { .init(stringLiteral: #function) }
    static var tipContainer: Self { .init(stringLiteral: #function) }
    static var tip: Self { .init(stringLiteral: #function) }
    static var iframeContainer: Self { .init(stringLiteral: #function) }
    static var iframe: Self { .init(stringLiteral: #function) }
    static var linkedArticleContainer: Self { .init(stringLiteral: #function) }
    static var linkedArticleImage: Self { .init(stringLiteral: #function) }
    static var linkedArticleDetail: Self { .init(stringLiteral: #function) }

    // MARK: Article List
    static var articleList: Self { .init(stringLiteral: #function) }
    static var articleListContainer: Self { .init(stringLiteral: #function) }

    // Grid
    static var gridContainerArticleList: Self { .init(stringLiteral: #function) }
    static var gridItem1By3ArticleList: Self { .init(stringLiteral: #function) }
    static var gridItem2By3ArticleList: Self { .init(stringLiteral: #function) }
    
    // Flex
    static var flexContainer: Self { .init(stringLiteral: #function) }
    static var flexItem: Self { .init(stringLiteral: #function) }
    
    // Article Byline
    static var bylineContainer: Self { .init(stringLiteral: #function) }
    static var bylineItem: Self { .init(stringLiteral: #function) }
}
