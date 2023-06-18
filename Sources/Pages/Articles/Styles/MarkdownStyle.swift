//
//  MarkdownStyle.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import Foundation
import HTMLDSL

func markdownContainerStyle(_ mediaType: MediaStyle.DeviceType) -> CSSStyle {
    let style = ClassStyle(forClass: .markdownContainer)
        .size(width: mediaType == .wide ? .percentage(50) : .percentage(90))
        .margin(left: .auto, right: .auto)
    return MediaStyle(for: mediaType, with: style)
}

enum Typography {
    enum Global {
        static let lineHeight: Float = 1.75
    }

    enum Font {
        enum Size {
            static private let scale: Float = 1.25

            static let body: Float = 1
            static let largeTitle: Float = pow(scale, 4)
            static let title1: Float = pow(scale, 3)
            static let title2: Float = pow(scale, 2)
            static let title3: Float = pow(scale, 1)
        }
    }

    enum Margin {
        static private let scale: Float = 2

        static let small: Float = 1 / scale
        static let medium: Float = 1
        static let large: Float = 1 * scale
        static let xLarge: Float = large + medium
    }
}

public struct MarkdownStyle: CSSStyle {
    public let key: CustomStringConvertible
    public let styles = [Style]()
    
    public var element: String

    init(listImage: String) {
        self.key = Tag.empty.description

        let commonStyle = ClassStyle(elementsInClass: .markdown)
            .margin(bottom: .length(.relativeToRoot(Typography.Margin.medium)))
            .lineHeight(.number(Typography.Global.lineHeight))

        let h1Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h1)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.largeTitle))
            .font(weight: .normal)
            .margin(top: .length(.relativeToRoot(Typography.Margin.large)))

        let h2Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h2)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.title1))
            .font(weight: .normal)

        let h3Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h3)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.title2))
            .font(weight: .normal)

        let pStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.paragraph))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))

        let introStyle = ClassStyle(forClass: .markdown, withClass: .intro)
            .font(size: .relativeToRootFontSize(Typography.Font.Size.title3))
            .font(weight: .number(300))
        
        let imageStyle = ClassStyle(forClass: .markdown, withTag: .selfClosing(.image))
            .sizeFull()
            .cornerRadius(uniform: .pixel(8))
            .margin(top: .length(.relativeToRoot(Typography.Margin.large)))
        let imageCreditsStyle = ClassStyle(forClass: .markdown, withClass: .imageCredits)
            .foregroundColor(Color.Dark.ActiveNavBarItem)
            .align(.center)
            .margin(top: .length(.relativeToRoot(-Typography.Margin.medium)),
                    bottom: .length(.relativeToRoot(Typography.Margin.large)))
        
        let dialogueStyle = ClassStyle(forClass: .dialogue)
            .margin(top: .length(.relativeToRoot(Typography.Margin.xLarge)),
                    bottom: .length(.relativeToRoot(Typography.Margin.xLarge)))
            .padding(left: .pixel(40), top: .pixel(20), right: .pixel(20), bottom: .pixel(20))
            .backgroundColor(.Light.IndexSectionHeaderBackground)
            .cornerRadius(uniform: .pixel(20))

        let linkStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.link))
            .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
            .textDecoration(.none)
        let linkHoverStyle = ClassStyle(.markdown, tag: .enclosing(.link), cssTag: .hover)
            .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
            .textDecoration(.underline)
        let styles = [
            commonStyle,
            h1Style,
            h2Style,
            h3Style,
            pStyle,
            introStyle,
            imageStyle,
            imageCreditsStyle,
            dialogueStyle,
            linkStyle,
            linkHoverStyle
        ]
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
