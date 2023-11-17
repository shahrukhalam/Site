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
    
    private let subsections: [Subsection]
    
    init(model: [Subsection]) {
        self.subsections = model
    }
    
    var body: some HTMLBodyContentView {
        let gridViews = subsections.map { subsection in
            var classes: [CSSClass] = [.gridItemIndex]
            switch subsection.layout {
            case .highlighted:
                classes += [.gridItemHeroIndex]
            case .compact:
                break
            }
            
            let gridItemViewErased: AnyView
            switch subsection.layout {
            case .highlighted:
                fatalError("Highlighted layout is no longer supported")
            case .compact:
                let gridItemView = GridView(model: subsection.detail)
                    .position(.relative)
                    .aspectRatio(width: 5, height: 4)
                    .identifyBy(cssClasses: classes)
                gridItemViewErased = AnyView(gridItemView)
            }
            
            return gridItemViewErased
        }
        
        return Div(AnyView(gridViews))
            .identifyBy(cssClass: .gridContainerIndex)
    }
}

struct GridView: HTMLBodyContentView {
    let tag: Tag = .enclosing(.div)
    var attributes: [Attribute] = []
    
    private let detail: Detail
    
    init(model: Detail) {
        self.detail = model
    }
    
    var body: some HTMLBodyContentView {
        Div {
            Image(detail.image.url, alternateText: detail.image.description)
                .position(.absolute)
                .size(width: .percentage(100), height: .percentage(100))
                .contentMode(.aspectFill)
                .cornerRadius(.pixel(16))
            
            Link(text: .empty, url: detail.link.url)
                .position(.absolute, left: .pixel(0), top: .pixel(0), right: .pixel(0), bottom: .pixel(0))
                .accessibility(detail.image.description)

            Div {
                Headings(detail.description.title, type: .h2)
                    .font(size: .relativeToRootFontSize(Typography.Font.Size.subheading))
                    .font(weight: .number(600))
                
                Headings(detail.description.subtitle, type: .h3)
                    .identifyBy(cssClass: .collectionDescription)
                    .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                    .font(weight: .normal)
                    .margin(top: .length(.relativeToRoot(Typography.Margin.byline)))
                
                Link(text: detail.link.text, url: detail.link.url)
                    .identifyBy(cssClass: .link)
                    .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                    .font(weight: .number(Typography.Font.Weight.byline))
                    .display(.inlineBlock)
                    .margin(top: .length(.relativeToRoot(Typography.Margin.heading3)))
            }
            .padding(uniform: .length(.relativeToRoot(Typography.Margin.heading3)))
            .position(.absolute, left: .pixel(0), right: .pixel(0), bottom: .pixel(0))
            .cornerRadius([.pixel(0), .pixel(0), .pixel(16), .pixel(16)])
            .identifyBy(cssClass: .gridDetailsContainerIndex)
        }
    }
}
