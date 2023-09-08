//
//  GridStyle.swift
//  
//
//  Created by Shahrukh Alam on 17/09/22.
//

import HTMLDSL

// TODO: Fix ContentMode of Image
/// Row gap is not 12 because of the problem with **Image** `ContentMode`
private let gridContainerOwnStyle = ClassStyle(forClass: .gridContainerIndex)
    .display(.grid)
    .gridNumberOfColumns(2)
    .gridColumn(gap: 12)
    .gridRow(gap: 12)
private let detailsContainerStyle = ClassStyle(forClass: .gridContainerIndex, withClass: .gridDetailsContainerIndex)
    .backgroundVariable(.article_list_glass)
    .filter(saturationInPercentage: 180, blurInPixel: 20)
private let collectionDescriptionStyle = ClassStyle(forClass: .gridContainerIndex, withClass: .collectionDescription)
    .lineHeight(.number(Typography.LineHeight.subheading))
private let gridContainerLinkStyle = ClassStyle(.gridItemIndex, cssTag: .hover, tag: .enclosing(.link))
    .textDecoration(.underline)
public let gridContainerStyleIndex: [CSSStyle] = [gridContainerOwnStyle, detailsContainerStyle, collectionDescriptionStyle, gridContainerLinkStyle]

private let gridContainerSmallOwnStyle = ClassStyle(forClass: .gridContainerIndex)
    .gridNumberOfColumns(1)
public let gridContainerSmallStyleIndex: [CSSStyle] = [gridContainerSmallOwnStyle]

public let gridHeroStyle = ClassStyle(forClass: .gridItemHeroIndex)
    .gridColumn(location: 1, size: 3)
