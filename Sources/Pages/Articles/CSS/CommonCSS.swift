//
//  CommonCSS.swift
//  
//
//  Created by Shahrukh Alam on 10/08/22.
//

import HTMLDSL

var commonCSS: some HTMLHeadContentView {
    HeadStyle {
        KickOffStyle()
        
        RootStyle()
        RootStyle(.light) /// Default is `dark` mode
        MediaStyle(for: .wide, with: RootStyle(.wide))
        MediaStyle(for: .small, with: RootStyle(.small))
        
        commonStyles
        
        MediaStyle(for: .wide, with: fontStyles)
        MediaStyle(for: .small, with: fontStylesSmall)
        
        NavStyle()
    }
}
