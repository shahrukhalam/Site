//
//  Grid.swift
//  
//
//  Created by Shahrukh Alam on 17/09/22.
//

import Modeling
import HTMLDSL

struct Grid: HTMLBodyContentView {
    var tag: Tag = .empty
    var attributes: [Attribute] = []
    
    private let model: [(Detail, isHiddenInDesktop: Bool)]
    
    init(model: [(Detail, isHiddenInDesktop: Bool)]) {
        self.model = model
    }
    
    var body: some HTMLBodyContentView {
        let gridViews = model.map { (detail, isHiddenInDesktop) -> AnyView in
            let classes: [CSSClass] = isHiddenInDesktop ? [.gridItem, .desktopHidden] : [.gridItem]

            let gridView = Div {
                Link(text: .empty, url: detail.link.url)
                    .position(.absolute, left: .pixel(0), top: .pixel(0), right: .pixel(0), bottom: .pixel(0))
                    .accessibility(detail.image.description)

                Image(detail.image.url, alternateText: detail.image.description)
                    .backgroundColor(isDarkMode ? .Dark.IndexGridImageBackground : .Light.IndexGridImageBackground)
                    .size(width: .percentage(100))
                    .aspectRatio(width: detail.image.aspectRatio.width,
                                 height: detail.image.aspectRatio.height)
                    .cornerRadius([.pixel(16), .pixel(16), .pixel(0), .pixel(0)])
                
                Div {
                    Headings(detail.description.title, type: .h2)
                        .identifyBy(cssClass: .headline)
                    Headings(detail.description.subtitle, type: .h3)
                        .identifyBy(cssClass: .subheadline)
                    Link(text: detail.link.text, url: detail.link.url)
                        .identifyBy(cssClass: .link)
                        .display(.inlineBlock)
                        .margin(top: .pixel(16))
                }
                .margin(uniform: .pixel(16))
            }
                .position(.relative)
                .backgroundColor(isDarkMode ? Color.Dark.IndexGridBackground : Color.Light.IndexGridBackground)
                .cornerRadius(.pixel(16))
                .identifyBy(cssClasses: classes)
            
            return AnyView(gridView)
        }
        
        return Div(AnyView(gridViews))
            .identifyBy(cssClass: .gridContainer)
            .margin(top: .pixel(12))
    }
}
