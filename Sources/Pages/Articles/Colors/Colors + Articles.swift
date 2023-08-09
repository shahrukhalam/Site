//
//  Colors + Articles.swift
//  
//
//  Created by Shahrukh Alam on 08/08/22.
//

import HTMLDSL

var isDarkMode: Bool = false

extension CSSVariable where T == Color {
    static var index_background: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.IndexBackground, light: .Light.IndexBackground))
    }
    
    static var index_foreground: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.IndexForeground, light: .Light.IndexForeground))
    }
}

extension Color {
    enum Dark {
        static var NavBarColor: Color { .rgba(red: 29, green: 29, blue: 31, alpha: 0.72) }
        static var ActiveNavBarItem: Color { .rgba(red: 139, green: 139, blue: 139, alpha: 1.0) }
        static var InactiveNavBarItem: Color { .html(.White) }
        static var HoverNavBarItem: Color { .rgba(red: 41, green: 151, blue: 255, alpha: 1.0) }
        static var NavBarDividerColor: Color { .rgba(red: 76, green: 76, blue: 76, alpha: 1.0) }
        
        static var IndexBackground: Color { .rgba(red: 25, green: 25, blue: 25, alpha: 1) } // #191919
        static var IndexForeground: Color { .rgba(red: 255, green: 255, blue: 255, alpha: 0.81) }
        static var IndexSectionHeaderBackground: Color { .rgba(red: 20, green: 20, blue: 21, alpha: 1.0) }
        static var IndexGridBackground: Color { .html(.Black) }
        static var IndexGridImageBackground: Color { .rgba(red: 25, green: 25, blue: 25, alpha: 1.0) }
        
//        static var ArticleBackground: Color { .rgba(red: 29, green: 29, blue: 31, alpha: 1.0) }
        static var ArticleBackground: Color { .html(.Black) }
        static var ArticleImageBorder: Color { .rgba(red: 76, green: 76, blue: 76, alpha: 1.0) }

        static var Background: Color { .html(.Black) }
        static var Foreground: Color { .html(.White) }
        static var LinkNormalForeground: Color { .rgba(red: 41, green: 151, blue: 255, alpha: 1.0) }
        static var Title404: Color { .rgba(red: 133, green: 133, blue: 133, alpha: 1.0) }
        static var Subtitle404: Color { .rgba(red: 110, green: 110, blue: 110, alpha: 1.0) }
    }
    
    enum Light {
        static var NavBarColor: Color { .rgba(red: 250, green: 250, blue: 250, alpha: 0.8) }
        static var ActiveNavBarItem: Color { .html(.Black) }
        static var InactiveNavBarItem: Color { .rgba(red: 60, green: 60, blue: 60, alpha: 1.0) } // #3C3C3C
        static var HoverNavBarItem: Color { .html(.Black) }
        static var NavBarDividerColor: Color { .rgba(red: 230, green: 230, blue: 230, alpha: 1.0) }
        
        static var IndexBackground: Color { .html(.White) }
        static var IndexForeground: Color { .html(.Black) }
        static var IndexSectionHeaderBackground: Color { .rgba(red: 250, green: 250, blue: 250, alpha: 1.0) }
        static var IndexGridBackground: Color { .html(.White) }
        static var IndexGridImageBackground: Color { .rgba(red: 245, green: 245, blue: 245, alpha: 1.0) }
        
        static var ArticleBackground: Color { .html(.White) }
        static var ArticleImageBorder: Color { .rgba(red: 139, green: 139, blue: 139, alpha: 1.0) }
        static var ArticleText: Color { .rgba(red: 55, green: 53, blue: 47, alpha: 1) }
        /// `Note` section of https://developer.apple.com/documentation/swift/swift-standard-library
        static var ArticleNoteBackground: Color { .rgba(red: 245, green: 245, blue: 247, alpha: 1.0) }
        static var ArticleNoteBorder: Color { .rgba(red: 105, green: 105, blue: 105, alpha: 1.0) }
        static var ArticleWarningBackground: Color { .hexWithHash("#FCF1F5") }
        static var ArticleWarningBorder: Color { .hexWithHash("#EA3422") }
        static var ArticleImportantBackground: Color { .hexWithHash("#FFFEF3") }
        static var ArticleImportantBorder: Color { .hexWithHash("#8D6F22") }
        /// `Tip` section of https://developer.apple.com/documentation/xcode/formatting-your-documentation-content
        static var ArticleTipBackground: Color { .hexWithHash("#FBFFFF") }
        static var ArticleTipBorder: Color { .hexWithHash("#357A77") }
        
        static var ArticleListGlassBackgroundColor: Color { .rgba(red: 250, green: 250, blue: 250, alpha: 0.6) }
        /// top-left color o `wave.jpg`
        static var ArticleListBackgroundColor: Color { .hexWithHash("#8DCAF9") }

        static var Background: Color { .html(.White) }
        static var Foreground: Color { .html(.Black) }
        static var LinkNormalForeground: Color { .rgba(red: 0, green: 102, blue: 204, alpha: 1.0) }
    }
}
