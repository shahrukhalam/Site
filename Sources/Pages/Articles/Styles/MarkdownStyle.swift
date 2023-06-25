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
    enum LineHeight {
        static let largeTitle: Float = 1.2
        static let title1: Float = 1.3
        static let title2: Float = 1.4
        static let body: Float = 1.5
    }

    enum Font {
        enum Size {
            static private let scale: Float = 1.2

            static let largeTitle: Float = pow(scale, 6)
            static let title1: Float = pow(scale, 5)
            static let title2: Float = pow(scale, 4)
            static let title3: Float = pow(scale, 3)
            static let title4: Float = pow(scale, 2)
            static let title5: Float = pow(scale, 1)
            static let body: Float = 1
        }
    }

    enum Margin {
        static private let scale: Float = 2

        static let xxSmallContainer: Float = 1 / (3 * scale)
        static let xSmallContainer: Float = 1 / (2 * scale)
        static let body: Float = 1 / scale
        static let title2Top: Float = 2 / scale
        static let title1Top: Float = 3 / scale
        static let largeTitleTop: Float = 4 / scale
        static let xLargeContainer: Float = 5 / scale
    }
}

public struct MarkdownStyle: CSSStyle {
    public let key: CustomStringConvertible
    public let styles = [Style]()
    
    public var element: String

    init(listImage: String) {
        self.key = Tag.empty.description

        let commonStyle = ClassStyle(elementsInClass: .markdown)
            .lineHeight(.number(Typography.LineHeight.body))
            .foregroundColor(.Light.ArticleText)
            .margin(bottom: .length(.relativeToRoot(Typography.Margin.body)))

        let h1Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h1)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.title1))
            .lineHeight(.number(Typography.LineHeight.title1))
            .margin(top: .length(.relativeToRoot(Typography.Margin.xLargeContainer)),
                    bottom: .length(.relativeToRoot(Typography.Margin.body)))

        let h2Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h2)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.title2))
            .lineHeight(.number(Typography.LineHeight.title2))
            .margin(top: .length(.relativeToRoot(Typography.Margin.title2Top)))

        let h3Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h3)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.title3))
            .lineHeight(.number(Typography.LineHeight.title2))
            .margin(top: .length(.relativeToRoot(Typography.Margin.body)))

        let h4Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h4)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.title4))
            .lineHeight(.number(Typography.LineHeight.body))
            .margin(top: .length(.relativeToRoot(Typography.Margin.body)))

        let pStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.paragraph))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))

        let introStyle = ClassStyle(forClass: .markdown, withClass: .intro)
            .font(size: .relativeToRootFontSize(Typography.Font.Size.title5))
            .font(weight: .number(300))
            .lineHeight(.number(Typography.LineHeight.title1))
            .foregroundColor(.Light.ArticleNoteBorder)
        
        let imageStyle = ClassStyle(forClass: .markdown, withTag: .selfClosing(.image))
            .sizeFull()
            .cornerRadius(uniform: .pixel(8))
            .margin(top: .length(.relativeToRoot(Typography.Margin.title1Top)),
                    bottom: .length(.relativeToRoot(Typography.Margin.title1Top)))
        let imageCreditsStyle = ClassStyle(forClass: .markdown, withClass: .imageCredits)
            .foregroundColor(Color.Dark.ActiveNavBarItem)
            .align(.center)
            .margin(top: .length(.relativeToRoot(-Typography.Margin.largeTitleTop)),
                    bottom: .length(.relativeToRoot(Typography.Margin.title1Top)))
        
        let dialogueStyle = ClassStyle(forClass: .dialogue)
            .margin(top: .length(.relativeToRoot(Typography.Margin.largeTitleTop)),
                    bottom: .length(.relativeToRoot(Typography.Margin.largeTitleTop)))
            .padding(left: .length(.relativeToRoot(Typography.Margin.title1Top)),
                     top: .length(.relativeToRoot(Typography.Margin.title2Top)),
                     right: .length(.relativeToRoot(Typography.Margin.title2Top)),
                     bottom: .length(.relativeToRoot(Typography.Margin.title2Top)))
            .backgroundColor(.Light.ArticleNoteBackground)
            .border(width: .pixel(1), color: .Light.ArticleNoteBorder)
            .cornerRadius(uniform: .pixel(20))
        let noteStyle = ClassStyle(forClass: .markdown, withClass: .note)
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .foregroundColor(.Light.ArticleNoteBorder)
        
        let warningContainerStyle = ClassStyle(forClass: .warningContainer)
            .margin(top: .length(.relativeToRoot(Typography.Margin.largeTitleTop)),
                    bottom: .length(.relativeToRoot(Typography.Margin.largeTitleTop)))
            .padding(left: .length(.relativeToRoot(Typography.Margin.title1Top)),
                     top: .length(.relativeToRoot(Typography.Margin.title2Top)),
                     right: .length(.relativeToRoot(Typography.Margin.title2Top)),
                     bottom: .length(.relativeToRoot(Typography.Margin.title2Top)))
            .backgroundColor(.Light.ArticleWarningBackground)
            .border(width: .pixel(1), color: .Light.ArticleWarningBorder)
            .cornerRadius(uniform: .pixel(20))
        let warningStyle = ClassStyle(forClass: .markdown, withClass: .warning)
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .foregroundColor(.Light.ArticleWarningBorder)
        
        let importantContainerStyle = ClassStyle(forClass: .importantContainer)
            .margin(top: .length(.relativeToRoot(Typography.Margin.largeTitleTop)),
                    bottom: .length(.relativeToRoot(Typography.Margin.largeTitleTop)))
            .padding(left: .length(.relativeToRoot(Typography.Margin.title1Top)),
                     top: .length(.relativeToRoot(Typography.Margin.title2Top)),
                     right: .length(.relativeToRoot(Typography.Margin.title2Top)),
                     bottom: .length(.relativeToRoot(Typography.Margin.title2Top)))
            .backgroundColor(.Light.ArticleImportantBackground)
            .border(width: .pixel(1), color: .Light.ArticleImportantBorder)
            .cornerRadius(uniform: .pixel(20))
        let importantStyle = ClassStyle(forClass: .markdown, withClass: .important)
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .foregroundColor(.Light.ArticleImportantBorder)

        let linkStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.link))
            .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
            .textDecoration(.none)
        let linkHoverStyle = ClassStyle(.markdown, tag: .enclosing(.link), cssTag: .hover)
            .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
            .textDecoration(.underline)

        let ulStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.unorderedList))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .margin(left: .length(.relativeToRoot(Typography.Margin.title1Top)))
        let olStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.orderedList))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .margin(left: .length(.relativeToRoot(Typography.Margin.title1Top)))

        let codeStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.code))
            .padding(left: .pixel(6), top: .pixel(3), right: .pixel(6), bottom: .pixel(3))
            .backgroundColor(.Light.ArticleNoteBackground)
            .foregroundColor(.Light.ArticleWarningBorder)
            .cornerRadius(uniform: .pixel(3))
        let codeStyle2 = ClassStyle(forClass: .dialogue, withTag: .enclosing(.code))
            .backgroundColor(.Light.NavBarDividerColor)
        let codeStyle3 = ClassStyle(forClass: .warningContainer, withTag: .enclosing(.code))
            .backgroundColor(.Light.NavBarDividerColor)

        let styles = [
            commonStyle,
            h1Style,
            h2Style,
            h3Style,
            h4Style,
            pStyle,
            introStyle,
            noteStyle,
            imageStyle,
            imageCreditsStyle,
            dialogueStyle,
            linkStyle,
            linkHoverStyle,
            warningStyle,
            warningContainerStyle,
            importantStyle,
            importantContainerStyle,
            ulStyle,
            olStyle,
            codeStyle,
            codeStyle2,
            codeStyle3
        ]
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
