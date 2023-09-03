//
//  CommonStyles.swift
//  
//
//  Created by Shahrukh Alam on 10/08/22.
//

import HTMLDSL

private let linkStyle = ClassStyle(forClass: .link)
    .foregroundVariable(.link_foreground)
    .font(size: .percentage(100))
    .textDecoration(.none)

private let linkHoverStyle = ClassStyle(forClass: .link, withCSSTag: .hover)
    .foregroundVariable(.link_foreground)
    .textDecoration(.underline)

private let pillLinkStyle = ClassStyle(forClass: .pillLink)
    .foregroundVariable(.link_foreground)
    .font(size: .percentage(100))
    .textDecoration(.none)
    .border(color: .variable(CSSVariable<Color>.link_foreground.name))

private let pillLinkHoverStyle = ClassStyle(forClass: .pillLink, withCSSTag: .hover)
    .foregroundVariable(.index_background)
    .backgroundVariable(.link_foreground)

public let commonStyles: [CSSStyle] = [
    linkStyle,
    linkHoverStyle,
    pillLinkStyle,
    pillLinkHoverStyle,
]
