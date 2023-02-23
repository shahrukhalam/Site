//
//  Colors + Articles.swift
//  
//
//  Created by Shahrukh Alam on 08/08/22.
//

import HTMLDSL

var isDarkMode: Bool = false

extension Color {
    enum Dark {
        static var NavBarColor: Color { .rgba(red: 29, green: 29, blue: 31, alpha: 0.72) }
        static var ActiveNavBarItem: Color { .rgba(red: 139, green: 139, blue: 139, alpha: 1.0) }
        static var InactiveNavBarItem: Color { .html(.White) }
        static var HoverNavBarItem: Color { .rgba(red: 41, green: 151, blue: 255, alpha: 1.0) }
        static var NavBarDividerColor: Color { .rgba(red: 76, green: 76, blue: 76, alpha: 1.0) }
        
        static var IndexBackground: Color { .html(.Black) }
        static var IndexForeground: Color { .html(.White) }
        static var IndexSectionHeaderBackground: Color { .rgba(red: 20, green: 20, blue: 21, alpha: 1.0) }
        static var IndexGridBackground: Color { .html(.Black) }
        static var IndexGridImageBackground: Color { .rgba(red: 25, green: 25, blue: 25, alpha: 1.0) }
        
        static var ArticleBackground: Color { .rgba(red: 29, green: 29, blue: 31, alpha: 1.0) }
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

        static var Background: Color { .html(.White) }
        static var Foreground: Color { .html(.Black) }
        static var LinkNormalForeground: Color { .rgba(red: 0, green: 102, blue: 204, alpha: 1.0) }
    }
}
