//
//  GridStyle.swift
//  
//
//  Created by Shahrukh Alam on 17/09/22.
//

import HTMLDSL

private let gridContainerOwnStyle = ClassStyle(forClass: .gridContainer)
    .display(.grid)
    .gridNumberOfColumns(2)
    .gridColumn(gap: 12)
private let gridContainerLinkStyle = ClassStyle(.gridItem, cssTag: .hover, tag: .enclosing(.link))
    .textDecoration(.underline)
public let gridContainerStyle: [CSSStyle] = [gridContainerOwnStyle, gridContainerLinkStyle]

private let gridContainerSmallOwnStyle = ClassStyle(forClass: .gridContainer)
    .display(.grid)
    .gridNumberOfColumns(1)
    .gridRow(gap: 12)
public let gridContainerSmallStyle: [CSSStyle] = [gridContainerSmallOwnStyle, gridContainerLinkStyle]
