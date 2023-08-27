//
//  CommonMeta.swift
//  
//
//  Created by Shahrukh Alam on 20/08/22.
//

import Modeling
import HTMLDSL

func commonMeta(_ meta: MetaDetail, isApp: Bool = false) -> some HTMLHeadContentView {
    AnyView([
        AnyView(Title(meta.title)),
        AnyView(htmlMeta(description: meta.description, keywords: meta.keywords, isApp: isApp)),
        AnyView(socialMeta(title: meta.title,
                           description: meta.description,
                           image: meta.absoluteSocialImage,
                           url: meta.absoluteURL))
    ])
}

private func htmlMeta(description: String, keywords: Set<String>, isApp: Bool) -> some HTMLHeadContentView {
    let viewPort = isApp ? Meta(.viewport(width: .deviceWidth, scale: .full, maxScale: .full, isUserInteractionDisabled: true)) : Meta(.viewport(width: .deviceWidth, scale: .full))
    
    return AnyView([
        Meta(.characterSet(.utf8)),
        Meta(.name(.author, content: "Shahrukh Alam")),
        Meta(.name(.description, content: description)),
        Meta(.name(.keywords, content: keywords.joined(separator: ", "))),
        viewPort
    ])
}
