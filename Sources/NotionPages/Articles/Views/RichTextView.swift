//
//  RichTextView.swift
//
//
//  Created by Shahrukh Alam on 15/06/24.
//

import NotionParsing
import HTMLDSL

struct RichTextView: HTMLBodyTextContentView {
    let body: String

    let newLine: NewLine = .none

    let tag = Tag.empty
    var attributes = [Attribute]()

    let text: String

    init(_ richText: RichText) {
        self.text = richText.type.description

        var body = text
        if richText.annotations.bold {
            body = body.bold
        }
        if richText.annotations.italic {
            body = body.italic
        }
        if richText.annotations.strikethrough {
            body = body.delete
        }
        if richText.annotations.underline {
            body = body.underline
        }

        self.body = body
    }
}
