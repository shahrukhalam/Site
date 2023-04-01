//
//  MarkdownStyle.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import HTMLDSL

func markdownContainerStyle(_ mediaType: MediaStyle.DeviceType) -> CSSStyle {
    let style = ClassStyle(forClass: .markdownContainer)
        .size(width: mediaType == .wide ? .percentage(50) : .percentage(90))
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
            .margin(top: .pixel(30), bottom: .pixel(30))
//            .font(size: .pixel(34))
//            .font(weight: .normal)
            .align(.center)
        let h2Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h2)))
            .margin(top: .pixel(20), bottom: .pixel(10))
//            .font(size: .pixel(28))
//            .font(size: .percentage(250))
        let h3Style = ClassStyle(forClass: .markdown, withTag: .enclosing(.headings(.h3)))
            .margin(top: .pixel(10), bottom: .pixel(10))
//            .font(size: .percentage(200))
//            .font(size: .pixel(22))
        let pStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.paragraph))
            .margin(top: .pixel(30), bottom: .pixel(30))
//            .font(size: .percentage(125))
            .lineHeight(.percentage(180))
//            .lineHeight(.percentage(145))
//            .font(size: .pixel(17))
//            .font(weight: .normal)

        let introStyle = ClassStyle(forClass: .markdown, withClass: .intro)
            .margin(top: .pixel(10), bottom: .pixel(10))
//            .font(size: .percentage(125))
//            .lineHeight(.percentage(180))
            .lineHeight(.percentage(160))
//            .font(size: .pixel(16))
//            .font(weight: .normal)
            .foregroundColor(Color.Dark.ActiveNavBarItem)
        let imageStyle = ClassStyle(forClass: .markdown, withTag: .selfClosing(.image))
            .sizeFull()
            .margin(top: .pixel(10), bottom: .pixel(10))
            .cornerRadius(uniform: .pixel(8))
//            .border(color: isDarkMode ? Color.Dark.ArticleImageBorder : Color.Light.ArticleImageBorder)
        let imageCreditsStyle = ClassStyle(forClass: .markdown, withClass: .imageCredits)
            .margin(top: .pixel(-40))
//            .font(size: .percentage(100))
//            .font(size: .pixel(12))
//            .font(weight: .normal)
            .foregroundColor(Color.Dark.ActiveNavBarItem)
            .align(.center)
        let ulStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.unorderedList))
            .margin(left: .pixel(40), top: .pixel(12), bottom: .pixel(12))
//            .font(size: .percentage(125))
//            .font(size: .pixel(17))
            .lineHeight(.percentage(180))
            .listImage(url: listImage)
        let olStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.orderedList))
            .margin(left: .pixel(40), top: .pixel(20), bottom: .pixel(20))
//            .font(size: .percentage(125))
//            .font(size: .pixel(17))
            .lineHeight(.percentage(180))
        let liStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.list))
            .margin(bottom: .pixel(12))
//            .font(size: .pixel(17))
            .lineHeight(.percentage(180))
        
        let dialogueStyle = ClassStyle(forClass: .dialogue)
            .margin(top: .pixel(30), bottom: .pixel(30))
            .padding(left: .pixel(40), top: .pixel(10), right: .pixel(20), bottom: .pixel(10))
            .backgroundColor(.Light.IndexSectionHeaderBackground)
            .cornerRadius(uniform: .pixel(20))
        
        let blockquoteStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.blockquote))
//            .margin(bottom: .pixel(30))
//            .margin(left: .pixel(40))
//            .padding(left: .pixel(20))
//            .border(sides: [.left], width: .pixel(2), color: Color.Dark.NavBarDividerColor)
        
        let paragraphInBlockquoteStyle = ClassStyle(parent1: .markdown, parent12: .enclosing(.blockquote), child: .enclosing(.paragraph))
//            .font(size: .pixel(17))
//            .font(weight: .lighter)
//            .margin(uniform: .pixel(0))
            .foregroundColor(Color.Dark.ActiveNavBarItem)

        let linkStyle = ClassStyle(forClass: .markdown, withTag: .enclosing(.link))
            .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
            .textDecoration(.none)
        let linkHoverStyle = ClassStyle(.markdown, tag: .enclosing(.link), cssTag: .hover)
            .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
            .textDecoration(.underline)
        let styles = [h1Style, h2Style, h3Style, pStyle, introStyle, imageStyle, imageCreditsStyle, ulStyle, olStyle, liStyle, dialogueStyle, blockquoteStyle, paragraphInBlockquoteStyle, linkStyle, linkHoverStyle]
        self.element = styles.map { $0.element }.joined(separator: "\n")
    }
}
