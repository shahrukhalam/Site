//
//  ArticleView.swift
//  
//
//  Created by Shahrukh Alam on 15/06/24.
//

import HTMLDSL
import Modeling
import NotionParsing
import NotionHTML
import Pages

struct ArticleView: HTMLBodyContentView {
    var tag: Tag = .empty
    var attributes = [Attribute]()

    private let page: NotionParsing.Page
    private let meta: MetaDetail

    init(_ page: NotionParsing.Page, meta: MetaDetail) {
        self.page = page
        self.meta = meta
    }

    var body: some View {
        Div {
            Div {
                htmlBody(for: page)

                share(title: meta.title, url: meta.absoluteURL)
                    .margin(top: .length(.relativeToRoot(Typography.Margin.title)))

                Div {
                    Paragraphs("This is a free third party commenting service we are using for you, which needs you to sign in to post a comment, but the good bit is you can stay anonymous while commenting.")
                        .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                        .font(weight: .number(Typography.Font.Weight.byline))
                        .margin(bottom: .length(.relativeToRoot(Typography.Margin.byline)))
                        .identifyBy(cssClass: .commentBoxDisclosure)
                    commentBox
                }
                .margin(
                    top: .length(.relativeToRoot(Typography.Margin.title))
                )
            }
            .identifyBy(cssClass: .articleContainer)
        }
        .identifyBy(cssClass: .article)
    }
}
