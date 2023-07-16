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
        static let title: Float = 1.2
        static let heading: Float = 1.3
        static let subheading: Float = 1.4
        static let body: Float = 1.5
    }

    enum Font {
        enum Size {
            static let title: Float = 2.5
            static let heading1: Float = 1.875
            static let heading2: Float = 1.5
            static let heading3: Float = 1.25
            static let subheading: Float = 1.125
            static let body: Float = 1
        }
    }

    enum Margin {
        static let body: Float = 0.5
        static let title: Float = 4
        static let heading1: Float = 2
        static let heading2: Float = 1.5
        static let heading3: Float = 1
        static let subheading: Float = 0.75
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
            .margin(top: .length(.relativeToRoot(Typography.Margin.body)))

        let h1Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h1)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.title))
            .lineHeight(.number(Typography.LineHeight.title))
            .margin(top: .length(.relativeToRoot(Typography.Margin.title)))

        let h2Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h2)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.heading1))
            .font(weight: .number(600))
            .lineHeight(.number(Typography.LineHeight.heading))
            .margin(top: .length(.relativeToRoot(Typography.Margin.heading1)))

        let h3Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h3)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.heading2))
            .font(weight: .number(600))
            .lineHeight(.number(Typography.LineHeight.heading))
            .margin(top: .length(.relativeToRoot(Typography.Margin.heading2)))

        let h4Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h4)))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.heading3))
            .font(weight: .number(600))
            .lineHeight(.number(Typography.LineHeight.heading))
            .margin(top: .length(.relativeToRoot(Typography.Margin.heading3)))

        let pStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.paragraph))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))

        let introStyle = ClassStyle(forClass: .markdown, withClass: .intro)
            .font(size: .relativeToRootFontSize(Typography.Font.Size.subheading))
            .font(weight: .number(300))
            .lineHeight(.number(Typography.LineHeight.subheading))
            .foregroundColor(.Light.ArticleNoteBorder)
            .margin(top: .length(.relativeToRoot(Typography.Margin.subheading)))
        
        let imageStyle = ClassStyle(forClass: .markdown, withTag: .selfClosing(.image))
            .display(.flex)
            .size(maxWidth: .percentage(100))
            .margin(
                left: .auto,
                top: .length(.relativeToRoot(Typography.Margin.heading1)),
                right: .auto,
                bottom: .length(.relativeToRoot(Typography.Margin.heading1))
            )
            .cornerRadius(uniform: .pixel(8))

        let imageCreditsStyle = ClassStyle(forClass: .markdown, withClass: .imageCredits)
            .foregroundColor(Color.Dark.ActiveNavBarItem)
            .align(.center)
            .margin(
                top: .length(.relativeToRoot(-Typography.Margin.heading2)),
                bottom: .length(.relativeToRoot(Typography.Margin.heading1))
            )
        
        let dialogueStyle = ClassStyle(forClass: .dialogue)
            .margin(
                top: .length(.relativeToRoot(Typography.Margin.heading1)),
                bottom: .length(.relativeToRoot(Typography.Margin.heading1))
            )
            .padding(
                left: .length(.relativeToRoot(Typography.Margin.heading1)),
                top: .length(.relativeToRoot(Typography.Margin.heading2)),
                right: .length(.relativeToRoot(Typography.Margin.heading2)),
                bottom: .length(.relativeToRoot(Typography.Margin.heading2))
            )
            .backgroundColor(.Light.ArticleNoteBackground)
            .border(width: .pixel(1), color: .Light.ArticleNoteBorder)
            .cornerRadius(uniform: .pixel(20))
        let noteStyle = ClassStyle(forClass: .markdown, withClass: .note)
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .foregroundColor(.Light.ArticleNoteBorder)
            .margin(top: .pixel(0))

        let warningContainerStyle = ClassStyle(forClass: .warningContainer)
            .margin(
                top: .length(.relativeToRoot(Typography.Margin.heading1)),
                bottom: .length(.relativeToRoot(Typography.Margin.heading1))
            )
            .padding(
                left: .length(.relativeToRoot(Typography.Margin.heading1)),
                top: .length(.relativeToRoot(Typography.Margin.heading2)),
                right: .length(.relativeToRoot(Typography.Margin.heading2)),
                bottom: .length(.relativeToRoot(Typography.Margin.heading2))
            )
            .backgroundColor(.Light.ArticleWarningBackground)
            .border(width: .pixel(1), color: .Light.ArticleWarningBorder)
            .cornerRadius(uniform: .pixel(20))
        let warningStyle = ClassStyle(forClass: .markdown, withClass: .warning)
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .foregroundColor(.Light.ArticleWarningBorder)
            .margin(top: .pixel(0))
        
        let importantContainerStyle = ClassStyle(forClass: .importantContainer)
            .margin(
                top: .length(.relativeToRoot(Typography.Margin.heading1)),
                bottom: .length(.relativeToRoot(Typography.Margin.heading1))
            )
            .padding(
                left: .length(.relativeToRoot(Typography.Margin.heading1)),
                top: .length(.relativeToRoot(Typography.Margin.heading2)),
                right: .length(.relativeToRoot(Typography.Margin.heading2)),
                bottom: .length(.relativeToRoot(Typography.Margin.heading2))
            )
            .backgroundColor(.Light.ArticleImportantBackground)
            .border(width: .pixel(1), color: .Light.ArticleImportantBorder)
            .cornerRadius(uniform: .pixel(20))
        let importantStyle = ClassStyle(forClass: .markdown, withClass: .important)
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .foregroundColor(.Light.ArticleImportantBorder)
            .margin(top: .pixel(0))

        let linkStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.link))
            .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
            .textDecoration(.none)
        let linkHoverStyle = ClassStyle(.markdown, tag: .enclosing(.link), cssTag: .hover)
            .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
            .textDecoration(.underline)

        let ulStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.unorderedList))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .margin(left: .length(.relativeToRoot(Typography.Margin.heading1)))
        let olStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.orderedList))
            .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
            .margin(left: .length(.relativeToRoot(Typography.Margin.heading1)))

        let codeStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.code))
            .padding(left: .pixel(6), top: .pixel(3), right: .pixel(6), bottom: .pixel(3))
            .backgroundColor(.Light.ArticleNoteBackground)
            .foregroundColor(.Light.ArticleWarningBorder)
            .cornerRadius(uniform: .pixel(3))
        let codeStyle2 = ClassStyle(forClass: .dialogue, withTag: .enclosing(.code))
            .backgroundColor(.Light.NavBarDividerColor)
        let codeStyle3 = ClassStyle(forClass: .warningContainer, withTag: .enclosing(.code))
            .backgroundColor(.Light.NavBarDividerColor)
        
        let videoStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.video))
            .display(.flex)
            .size(maxWidth: .percentage(100))
            .margin(
                left: .auto,
                top: .length(.relativeToRoot(Typography.Margin.heading1)),
                right: .auto,
                bottom: .length(.relativeToRoot(Typography.Margin.heading1))
            )
        
        let iframeStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.iframe))
            .display(.flex)
            .margin(
                left: .auto,
                top: .length(.relativeToRoot(Typography.Margin.heading1)),
                right: .auto,
                bottom: .length(.relativeToRoot(Typography.Margin.heading1))
            )

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
            codeStyle3,
            videoStyle,
            iframeStyle
        ]
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
