//
//  SectionHeaderStyle.swift
//  
//
//  Created by Shahrukh Alam on 17/09/22.
//

import HTMLDSL

public let sectionHeaderStyle = ClassStyle(forClass: .sectionHeader)
    .margin(uniform: .pixel(20))
    .backgroundColor(isDarkMode ? Color.Dark.IndexSectionHeaderBackground : Color.Light.IndexSectionHeaderBackground)

public let sectionHeaderSmallStyle = ClassStyle(forClass: .sectionHeader)
    .margin(top: .pixel(20), bottom: .pixel(20))
    .backgroundColor(isDarkMode ? Color.Dark.IndexSectionHeaderBackground : Color.Light.IndexSectionHeaderBackground)
