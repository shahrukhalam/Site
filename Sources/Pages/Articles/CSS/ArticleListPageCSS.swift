//
//  ArticleListPageCSS.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL

func articleListPageCSS() -> some HTMLHeadContentView {
    HeadStyle {
        htmlDarkStyle
        htmlLightMediaStyle
        
        MediaStyle(for: .wide, with: ArticleListStyle(.wide))
        MediaStyle(for: .small, with: ArticleListStyle(.small))
    }
}

private let htmlDarkStyle = TagStyle(for: .enclosing(.html))
    .backgroundImage(url: "/images/index/wave.jpg")
    .backgroundPosition(.center)
    .backgroundSize(.cover)

private let htmlLightStyle = TagStyle(for: .enclosing(.html))
    .backgroundImage(url: "/images/index/wave_light.jpg")
private let htmlLightMediaStyle = MediaStyle(for: .light, with: htmlLightStyle)
