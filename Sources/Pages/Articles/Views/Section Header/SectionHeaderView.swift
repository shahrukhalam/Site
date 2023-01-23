//
//  SectionHeaderView.swift
//  
//
//  Created by Shahrukh Alam on 17/09/22.
//

import Modeling
import HTMLDSL

func sectionHeader(with model: SectionHeader) -> some HTMLBodyContentView {
    Div {
        sectionHeaderContent(with: model)
    }
    .identifyBy(cssClass: .sectionHeader)
}
