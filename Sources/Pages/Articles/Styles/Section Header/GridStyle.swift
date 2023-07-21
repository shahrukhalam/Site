//
//  GridStyle.swift
//  
//
//  Created by Shahrukh Alam on 17/09/22.
//

import HTMLDSL

// TODO: Fix ContentMode of Image
/// Row gap is not 12 because of the problem with **Image** `ContentMode`
private let gridContainerOwnStyle = ClassStyle(forClass: .gridContainer)
    .display(.grid)
    .gridNumberOfColumns(2)
    .gridColumn(gap: 12)
    .gridRow(gap: 12)
private let collectionDescriptionStyle = ClassStyle(forClass: .gridContainer, withClass: .collectionDescription)
    .lineHeight(.number(Typography.LineHeight.subheading))
private let gridContainerLinkStyle = ClassStyle(.gridItem, cssTag: .hover, tag: .enclosing(.link))
    .textDecoration(.underline)
public let gridContainerStyle: [CSSStyle] = [gridContainerOwnStyle, collectionDescriptionStyle, gridContainerLinkStyle]

private let gridContainerSmallOwnStyle = ClassStyle(forClass: .gridContainer)
    .display(.grid)
    .gridNumberOfColumns(1)
    .gridRow(gap: 12)
public let gridContainerSmallStyle: [CSSStyle] = [gridContainerSmallOwnStyle, collectionDescriptionStyle, gridContainerLinkStyle]

public let gridHeroStyle = ClassStyle(forClass: .gridItemHero)
    .gridColumn(location: 1, size: 3)
