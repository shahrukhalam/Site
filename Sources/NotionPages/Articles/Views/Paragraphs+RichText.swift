//
//  Paragraphs+RichText.swift
//
//
//  Created by Shahrukh Alam on 15/06/24.
//

import NotionParsing
import HTMLDSL

extension Paragraphs {
    init(richTexts: [RichText]) {
        let richTextsElement = richTexts.map(RichTextView.init).map(\.body).joined()
        self.init(richTextsElement)
    }
}
