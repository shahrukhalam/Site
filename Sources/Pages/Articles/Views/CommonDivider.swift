//
//  CommonDivider.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL

var commonDivider: some HTMLBodyContentView {
    Divider()
        .identifyBy(cssClass: .dividerNav)
}
