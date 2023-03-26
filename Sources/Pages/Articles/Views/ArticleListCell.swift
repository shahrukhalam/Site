//
//  ArticleListCell.swift
//  
//
//  Created by Shahrukh Alam on 06/01/2023.
//

import HTMLDSL
import Modeling

struct ArticleListCell: HTMLBodyContentView {
    var tag: Tag = .empty
    var attributes = [Attribute]()

    private let article: Article

    init(article: Article) {
        self.article = article
    }

    var body: some View {
        Div {
            Link(text: article.detail.title, url: article.detail.url)
                .identifyBy(cssClasses: [.title2, .link])
                .margin(top: .pixel(60), bottom: .pixel(20))
                .display(.block)
            Image(article.detail.banner, alternateText: "Swift logo")
                .size(width: .percentage(100))
                .cornerRadius(.pixel(4))
            Headings(article.detail.intro, type: .h4)
                .identifyBy(cssClass: .callout)
                .padding(top: .pixel(10), bottom: .pixel(60))
        }
    }
}
