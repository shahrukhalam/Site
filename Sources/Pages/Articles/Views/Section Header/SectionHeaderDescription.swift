//
//  SectionHeaderDescription.swift
//  
//
//  Created by Shahrukh Alam on 17/09/22.
//

import Modeling
import HTMLDSL

func sectionHeaderDescription(with model: Description) -> some HTMLBodyContentView {
    Div {
        Div {
            Headings(model.title, type: .h1)
                .identifyBy(cssClasses: [.largeTitle, .centerText])
            Headings(model.subtitle, type: .h2)
                .identifyBy(cssClasses: [.body, .centerText])
        }
    }
}
