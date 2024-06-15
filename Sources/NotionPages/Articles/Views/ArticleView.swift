//
//  ArticleView.swift
//  
//
//  Created by Shahrukh Alam on 15/06/24.
//

import NotionParsing
import HTMLDSL
import Pages

struct ArticleView: HTMLBodyContentView {
    var tag: Tag = .empty
    var attributes = [Attribute]()

    private let page: NotionParsing.Page

    init(_ page: NotionParsing.Page) {
        self.page = page
    }

    var body: some View {
        Div {
            Div {
                Div {
                    Headings(
                        page.properties.title.richTexts.map(\.type.description).joined(), 
                        type: .h1
                    )
//                    BylineView(bylines: article.detail.bylines)
                }
                .identifyBy(cssClass: .markdown)

                Div {
                    for block in page.content?.blocks ?? [] {
                        switch block.type {
                        case .paragraph(let paragraph):
                            Paragraphs(richTexts: paragraph.richTexts)
                        case .bulletedListItem:
                            preconditionFailure("Not Handled")
                        }
                    }
                }
                .identifyBy(cssClass: .markdown)

//                if article.isSharable {
                    share(title: "article.detail.title", url: "article.absoluteURL")
                        .margin(top: .length(.relativeToRoot(Typography.Margin.title)))
//                }

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
            .identifyBy(cssClass: .markdownContainer)
        }
        .identifyBy(cssClass: .article)
    }
}
