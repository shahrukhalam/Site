//
//  Colors + Articles.swift
//  
//
//  Created by Shahrukh Alam on 08/08/22.
//

import HTMLDSL

var isDarkMode: Bool = false

public extension CSSVariable where T == Color {
    static var index_background: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.IndexBackground, light: .Light.IndexBackground))
    }
    
    static var index_foreground: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.IndexForeground, light: .Light.IndexForeground))
    }
    
    static var nav_bar_background: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.NavBarColor, light: .Light.NavBarColor))
    }
    
    static var nav_bar_active_item: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ActiveNavBarItem, light: .Light.ActiveNavBarItem))
    }
    
    static var nav_bar_inactive_item: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.InactiveNavBarItem, light: .Light.InactiveNavBarItem))
    }
    
    static var nav_bar_hover_item: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.HoverNavBarItem, light: .Light.HoverNavBarItem))
    }
    
    static var nav_bar_divider: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.NavBarDividerColor, light: .Light.NavBarDividerColor))
    }
    
    static var article_list_glass: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleListGlassBackgroundColor, light: .Light.ArticleListGlassBackgroundColor))
    }
    
    static var article_list_background: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleListBackgroundColor, light: .Light.ArticleListBackgroundColor))
    }

    static var link_foreground: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.LinkNormalForeground, light: .Light.LinkNormalForeground))
    }
    
    static var code_background: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleCodeBackground, light: .Light.ArticleCodeBackground))
    }
    
    static var code_foreground: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleCodeForeground, light: .Light.ArticleCodeForeground))
    }
    
    static var code_block_background: Self {
        .init(
            name: "color_\(#function)",
            value: (
                /// From Notion
                dark: .rgba(red: 255, green: 255, blue: 255, alpha: 0.03),
                light: .rgba(red: 247, green: 246, blue: 243, alpha: 1.0)
            )
        )
    }
    
    static var code_block_type: Self {
        .init(name: "color_\(#function)", value: (dark: .hexWithHash("#C7B0EA"), light: .hexWithHash("#6940A4")))
    }
    
    static var code_block_keyword: Self {
        .init(name: "color_\(#function)", value: (dark: .hexWithHash("#EE81B0"), light: .hexWithHash("#A0459F")))
    }
    
    static var code_block_string: Self {
        .init(name: "color_\(#function)", value: (dark: .hexWithHash("#DF8170"), light: .hexWithHash("#C03E2A")))
    }
    
    static var code_block_number: Self {
        .init(name: "color_\(#function)", value: (dark: .hexWithHash("#D6CA86"), light: .hexWithHash("#282ACF")))
    }

    static var note_background: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleNoteBackground, light: .Light.ArticleNoteBackground))
    }

    static var note_border: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleNoteBorder, light: .Light.ArticleNoteBorder))
    }

    static var warning_background: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleWarningBackground, light: .Light.ArticleWarningBackground))
    }

    static var warning_border: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleWarningBorder, light: .Light.ArticleWarningBorder))
    }

    static var important_background: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleImportantBackground, light: .Light.ArticleImportantBackground))
    }

    static var important_border: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleImportantBorder, light: .Light.ArticleImportantBorder))
    }

    static var tip_background: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleTipBackground, light: .Light.ArticleTipBackground))
    }

    static var tip_border: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleTipBorder, light: .Light.ArticleTipBorder))
    }
    
    static var table_border: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.ArticleTableBorder, light: .Light.ArticleTableBorder))
    }

    static var background_404: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.Background404, light: .Light.Background404))
    }

    static var title_404: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.Title404, light: .Light.Title404))
    }

    static var subtitle_404: Self {
        .init(name: "color_\(#function)", value: (dark: .Dark.Subtitle404, light: .Light.Subtitle404))
    }
}

extension Color {
    enum Dark {
        static var NavBarColor: Color { .rgba(red: 29, green: 29, blue: 31, alpha: 0.72) }
        static var ActiveNavBarItem: Color { .rgba(red: 245, green: 245, blue: 247, alpha: 0.5) }
        static var InactiveNavBarItem: Color { .rgba(red: 255, green: 255, blue: 255, alpha: 0.88) }
        static var HoverNavBarItem: Color { .rgba(red: 41, green: 151, blue: 255, alpha: 1.0) }
        static var NavBarDividerColor: Color { .rgba(red: 76, green: 76, blue: 76, alpha: 1.0) }
        
        static var IndexBackground: Color { .rgba(red: 25, green: 25, blue: 25, alpha: 1) }
        static var IndexForeground: Color { .rgba(red: 255, green: 255, blue: 255, alpha: 0.81) }
        static var IndexSectionHeaderBackground: Color { .rgba(red: 20, green: 20, blue: 21, alpha: 1.0) }
        static var IndexGridBackground: Color { .html(.Black) }
        static var IndexGridImageBackground: Color { .rgba(red: 25, green: 25, blue: 25, alpha: 1.0) }
        
//        static var ArticleBackground: Color { .rgba(red: 29, green: 29, blue: 31, alpha: 1.0) }
        static var ArticleBackground: Color { .html(.Black) }
        static var ArticleImageBorder: Color { .rgba(red: 76, green: 76, blue: 76, alpha: 1.0) }
        /// from Notion (same in `dark` & `light` modes)
        static var ArticleCodeBackground: Color { .rgba(red: 135, green: 131, blue: 120, alpha: 0.15) }
        static var ArticleCodeForeground: Color { .rgba(red: 235, green: 87, blue: 87, alpha: 1.0) }
        /// `Note` section of https://developer.apple.com/documentation/swift/swift-standard-library
        static var ArticleNoteBackground: Color { .hexWithHash("#323232") }
        static var ArticleNoteBorder: Color { .hexWithHash("#9A9A9C") }
        static var ArticleWarningBackground: Color { .hexWithHash("#2D0402") }
        static var ArticleWarningBorder: Color { .hexWithHash("#D4504B") }
        static var ArticleImportantBackground: Color { .hexWithHash("#2A2005") }
        static var ArticleImportantBorder: Color { .hexWithHash("#9E853D") }
        /// `Tip` section of https://developer.apple.com/documentation/xcode/formatting-your-documentation-content
        static var ArticleTipBackground: Color { .hexWithHash("#0F2C2A") }
        static var ArticleTipBorder: Color { .hexWithHash("#64B7B5") }
        static var ArticleTableBorder: Color { .rgba(red: 47, green: 47, blue: 47, alpha: 1) }

        static var ArticleListGlassBackgroundColor: Color { .rgba(red: 29, green: 29, blue: 31, alpha: 0.6) }
        /// top-left color of `wave.jpg`
        static var ArticleListBackgroundColor: Color { .hexWithHash("#1A1A3E") }

        static var Background: Color { .html(.Black) }
        static var Foreground: Color { .html(.White) }
        static var LinkNormalForeground: Color { .rgba(red: 41, green: 151, blue: 255, alpha: 1.0) }

        static var Background404: Color { .Dark.ArticleCodeBackground }
        static var Title404: Color { .rgba(red: 133, green: 133, blue: 133, alpha: 1.0) }
        static var Subtitle404: Color { .rgba(red: 110, green: 110, blue: 110, alpha: 1.0) }
    }
    
    enum Light {
        static var NavBarColor: Color { .rgba(red: 250, green: 250, blue: 250, alpha: 0.8) }
        static var ActiveNavBarItem: Color { .rgba(red: 0, green: 0, blue: 0, alpha: 0.56) } // ✅
        static var InactiveNavBarItem: Color { .rgba(red: 0, green: 0, blue: 0, alpha: 0.88) } // ✅
        static var HoverNavBarItem: Color { .rgba(red: 0, green: 102, blue: 204, alpha: 1.0) } // ✅
        static var NavBarDividerColor: Color { .rgba(red: 230, green: 230, blue: 230, alpha: 1.0) }
        
        static var IndexBackground: Color { .html(.White) }
        static var IndexForeground: Color { .rgba(red: 55, green: 53, blue: 47, alpha: 1) }
        static var IndexSectionHeaderBackground: Color { .rgba(red: 250, green: 250, blue: 250, alpha: 1.0) }
        static var IndexGridBackground: Color { .html(.White) }
        static var IndexGridImageBackground: Color { .rgba(red: 245, green: 245, blue: 245, alpha: 1.0) }
        
        static var ArticleBackground: Color { .html(.White) }
        static var ArticleImageBorder: Color { .rgba(red: 139, green: 139, blue: 139, alpha: 1.0) }
        static var ArticleText: Color { .rgba(red: 55, green: 53, blue: 47, alpha: 1) }
        /// from Notion (same in `dark` & `light` modes)
        static var ArticleCodeBackground: Color { .rgba(red: 135, green: 131, blue: 120, alpha: 0.15) }
        static var ArticleCodeForeground: Color { .rgba(red: 235, green: 87, blue: 87, alpha: 1.0) }

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
        static var ArticleTableBorder: Color { .rgba(red: 233, green: 233, blue: 231, alpha: 1) }
        
        static var ArticleListGlassBackgroundColor: Color { .rgba(red: 250, green: 250, blue: 250, alpha: 0.6) }
        /// top-left color of `wave_light.jpg`
        static var ArticleListBackgroundColor: Color { .hexWithHash("#8DCAF9") }

        static var Background: Color { .html(.White) }
        static var Foreground: Color { .html(.Black) }
        static var LinkNormalForeground: Color { .rgba(red: 0, green: 102, blue: 204, alpha: 1.0) }

        static var Background404: Color { .Light.ArticleCodeBackground }
        static var Title404: Color { .rgba(red: 133, green: 133, blue: 133, alpha: 1.0) }
        static var Subtitle404: Color { .rgba(red: 110, green: 110, blue: 110, alpha: 1.0) }
    }
}
