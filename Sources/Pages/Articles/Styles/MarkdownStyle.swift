//
//  MarkdownStyle.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import HTMLDSL

func markdownContainerStyle(_ mediaType: MediaStyle.DeviceType) -> CSSStyle {
    let style = ClassStyle(forClass: .markdownContainer)
        .size(width: mediaType == .wide ? .percentage(60) : .percentage(90))
        .margin(left: .auto, right: .auto)
    return MediaStyle(for: mediaType, with: style)
}

public struct MarkdownStyle: CSSStyle {
    public let key: CustomStringConvertible
    public let styles = [Style]()
    
    public var element: String

    init(listImage: String) {
        self.key = Tag.empty.description

        let h1Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h1)))
            .padding(top: .pixel(20), bottom: .pixel(20))
            .font(size: .percentage(300))
            .align(.center)
        let h2Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h2)))
            .padding(top: .pixel(20), bottom: .pixel(10))
            .font(size: .percentage(250))
        let h3Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h3)))
            .padding(top: .pixel(10), bottom: .pixel(10))
            .font(size: .percentage(200))
        let pStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.paragraph))
            .padding(top: .pixel(10), bottom: .pixel(10))
            .font(size: .percentage(125))
            .lineHeight(.percentage(160))
        let introStyle = ClassStyle(forClass: .markdown, withClass: .intro)
            .padding(top: .pixel(10), bottom: .pixel(10))
            .font(size: .percentage(125))
            .lineHeight(.percentage(160))
            .foregroundColor(Color.Dark.ActiveNavBarItem)
        let imageStyle = ClassStyle(forClass: .markdown, withTag: .selfClosing(.image))
            .sizeFull()
            .margin(top: .pixel(10), bottom: .pixel(10))
            .border(color: isDarkMode ? Color.Dark.ArticleImageBorder : Color.Light.ArticleImageBorder)
        let imageCreditsStyle = ClassStyle(forClass: .markdown, withClass: .imageCredits)
            .margin(top: .pixel(-30))
            .font(size: .percentage(100))
            .foregroundColor(Color.Dark.ActiveNavBarItem)
            .align(.center)
        let ulStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.unorderedList))
            .padding(bottom: .pixel(5))
            .font(size: .percentage(125))
            .lineHeight(.percentage(160))
            .listImage(url: listImage)
        let olStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.orderedList))
            .padding(bottom: .pixel(5))
            .font(size: .percentage(125))
            .lineHeight(.percentage(160))
        let blockquoteStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.blockquote))
            .margin(uniform: .pixel(20))
            .padding(left: .pixel(20))
            .border(sides: [.left], width: .pixel(2), color: Color.Dark.NavBarDividerColor)
        let linkStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.link))
            .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
            .textDecoration(.none)
        let linkHoverStyle = ClassStyle(.markdown, tag: .enclosing(.link), cssTag: .hover)
            .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
            .textDecoration(.underline)
        let styles = [h1Style, h2Style, h3Style, pStyle, introStyle, imageStyle, imageCreditsStyle, ulStyle, olStyle, blockquoteStyle, linkStyle, linkHoverStyle]
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
