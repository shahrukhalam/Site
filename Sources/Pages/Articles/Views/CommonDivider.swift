//
//  CommonDivider.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL

var commonDivider: some HTMLBodyContentView {
    Divider()
        .backgroundColor(isDarkMode ? Color.Dark.NavBarDividerColor : Color.Light.NavBarDividerColor)
        .size(height: .pixel(1))
        .border(width: .pixel(0))
}
