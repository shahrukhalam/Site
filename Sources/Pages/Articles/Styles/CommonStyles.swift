//
//  CommonStyles.swift
//  
//
//  Created by Shahrukh Alam on 10/08/22.
//

import HTMLDSL

private let centerTextStyle = ClassStyle(forClass: .centerText)
    .align(.center)

private let centerDivContainerXStyle = ClassStyle(forClass: .centerDivContainerX)
    .display(.flex)
    .flexAlign(.center)

private let centerDivContainerYStyle = ClassStyle(forClass: .centerDivContainerY)
    .display(.flex)
    .flexDirection(.vertical)
    .flexAlign(.center)
    .flexDistribute(.flexStart)

private let centerDivContainerStyle = ClassStyle(forClass: .centerDivContainer)
    .display(.flex)
    .flexDistribute(.center)
    .flexAlign(.center)

private let imageFullWidth = ClassStyle(forClass: .imageFullWidth)
    .margin(top: .pixel(20), bottom: .pixel(20))
    .size(width: .percentage(100))

private let imageHalfWidth = ClassStyle(forClass: .imageHalfWidth)
    .margin(left: .auto, top: .pixel(20), right: .auto, bottom: .pixel(20))
    .size(width: .percentage(50))

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

private let desktopHiddenStyle = MediaStyle(for: .wide,
                                            with: ClassStyle(forClass: .desktopHidden).display(.none))

private let mobileHiddenStyle = MediaStyle(for: .small,
                                           with: ClassStyle(forClass: .mobileHidden).display(.none))

public let commonStyles: [CSSStyle] = [
    centerTextStyle,
    centerDivContainerXStyle,
    centerDivContainerYStyle,
    centerDivContainerStyle,
    imageFullWidth,
    imageHalfWidth,
    linkStyle,
    linkHoverStyle,
    pillLinkStyle,
    pillLinkHoverStyle,
    desktopHiddenStyle,
    mobileHiddenStyle
]
