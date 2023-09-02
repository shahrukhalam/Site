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
        AnyView(htmlMeta(description: meta.description, isApp: isApp)),
        AnyView(
            socialMeta(
                title: meta.title,
                description: meta.description,
                image: meta.absoluteSocialImage,
                url: meta.absoluteURL
            )
        )
    ])
}

private func htmlMeta(description: String, isApp: Bool) -> some HTMLHeadContentView {
    let viewPort = isApp ? Meta(.viewport(width: .deviceWidth, scale: .full, maxScale: .full, isUserInteractionDisabled: true)) : Meta(.viewport(width: .deviceWidth, scale: .full))
    
    return AnyView([
        Meta(.characterSet(.utf8)),
        // TODO: Fix by actual Author
        Meta(.name(.author, content: "Shahrukh Alam")),
        Meta(.name(.description, content: description)),
        viewPort
    ])
}
