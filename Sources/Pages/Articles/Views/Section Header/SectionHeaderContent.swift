//
//  SectionHeaderContent.swift
//  
//
//  Created by Shahrukh Alam on 17/09/22.
//

import Modeling
import HTMLDSL

func sectionHeaderContent(with model: Section) -> some HTMLBodyContentView {
    Div {
        sectionHeaderDescription(with: model.description)
        Grid(model: model.subsections)
    }
    .identifyBy(cssClass: .sectionHeaderContent)
}
