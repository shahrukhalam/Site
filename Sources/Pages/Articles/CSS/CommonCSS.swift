//
//  CommonCSS.swift
//  
//
//  Created by Shahrukh Alam on 10/08/22.
//

import HTMLDSL

func commonCSS(isApp: Bool) -> some HTMLHeadContentView {
    HeadStyle {
        KickOffStyle()
        
        RootStyle(isApp: isApp)
        RootStyle(.light) /// Default is `dark` mode
        MediaStyle(for: .wide, with: RootStyle(.wide))
        MediaStyle(for: .small, with: RootStyle(.small))
        
        commonStyles
        
        MediaStyle(for: .wide, with: fontStyles)
        MediaStyle(for: .small, with: fontStylesSmall)
        
        NavStyle()
    }
}
