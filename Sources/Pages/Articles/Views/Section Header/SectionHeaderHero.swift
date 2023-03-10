//
//  SectionHeaderHero.swift
//  
//
//  Created by Shahrukh Alam on 17/09/22.
//

import Modeling
import HTMLDSL

func sectionHeaderHero(with model: Detail, color: Color = .html(.White)) -> some HTMLBodyContentView {
    Div {
        Link(text: .empty, url: model.link.url)
            .accessibility(model.image.description)
            .position(.absolute, left: .pixel(0), top: .pixel(0), right: .pixel(0), bottom: .pixel(0))
        
        Div {
            Headings(model.description.title, type: .h2)
                .foregroundColor(color)
                .identifyBy(cssClass: .title3)
            Headings(model.description.subtitle, type: .h3)
                .foregroundColor(color)
                .identifyBy(cssClass: .callout)
            Link(text: model.link.text, url: model.link.url)
                .identifyBy(cssClass: .link)
                .display(.inlineBlock)
                .margin(top: .pixel(11))
        }
        .position(.absolute, left: .percentage(60), top: .percentage(40), right: .percentage(10))

        Image(model.image.url, alternateText: model.image.description)
            .backgroundColor(isDarkMode ? .Dark.IndexGridImageBackground : .Light.IndexGridImageBackground)
            .size(width: .percentage(100))
            .aspectRatio(width: model.image.aspectRatio.width, height: model.image.aspectRatio.height)
            .cornerRadius(.pixel(16))
    }
    .padding(top: .pixel(30))
    .position(.relative)
    .identifyBy(cssClass: .sectionHeaderHero)
}
