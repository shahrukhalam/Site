//
//  CommonCSS.swift
//  
//
//  Created by Shahrukh Alam on 10/08/22.
//

import HTMLDSL

func commonCSS(page: Page, isApp: Bool) -> some HTMLHeadContentView {
    HeadStyle {
        KickOffStyle()

        RootStyle(page: page, colorScheme: .dark, isApp: isApp)
        RootStyle(page: page, colorScheme: .light, isApp: isApp)
        BodyStyle(isApp: isApp)
        
        commonStyles(page: page)
        
        switch page {
        case .home, .articleList, ._404:
            NavStyle()
        case .article, .about, .author:
            switch isApp {
            case false:
                NavStyle()
            case true:
                EmptyStyle()
            }
        }
        
        footerStyle
    }
}
