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
            switch subsection.device {
            case .small:
                classes += [.desktopHidden]
            case .wide:
                classes += [.mobileHidden]
            case .all:
                break
            }
            switch subsection.layout {
            case .highlighted:
                classes += [.gridItemHeroIndex]
            case .compact:
                break
            }
            
            let gridItemViewErased: AnyView
            switch subsection.layout {
            case .highlighted:
                let gridItemView = sectionHeaderHero(with: subsection.detail)
                    .position(.relative)
                    .backgroundColor(isDarkMode ? Color.Dark.IndexGridBackground : Color.Light.IndexSectionHeaderBackground)
                    .cornerRadius(.pixel(16))
                    .identifyBy(cssClasses: classes)
                gridItemViewErased = AnyView(gridItemView)
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
//            .margin(top: .pixel(40))
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
            Link(text: .empty, url: detail.link.url)
                .position(.absolute, left: .pixel(0), top: .pixel(0), right: .pixel(0), bottom: .pixel(0))
                .accessibility(detail.image.description)

            Image(detail.image.url, alternateText: detail.image.description)
            // TODO: Now, the background color in light mode is specific to journey
            // Photoshop can be used
                .backgroundColor(isDarkMode ? .Dark.IndexGridImageBackground : .hexWithHash("#161617"))
                .position(.absolute)
                .size(width: .percentage(100), height: .percentage(100))
                .contentMode(.aspectFill)
                .cornerRadius(.pixel(16))

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
