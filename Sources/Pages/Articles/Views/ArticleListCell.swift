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
            Image(article.detail.banner, alternateText: "Swift logo")
                .size(width: .percentage(100))
                .aspectRatio(width: 4, height: 1)
                .contentMode(.aspectFill)
                .cornerRadius([.pixel(8), .pixel(8), .pixel(0), .pixel(0)])
            Link(text: article.detail.title, url: article.relativeURL)
                .identifyBy(cssClasses: [.link])
                .display(.block)
                .margin(left: .pixel(24), top: .pixel(24), right: .pixel(24), bottom: .pixel(12))
                .foregroundColor(.textPrimary)
                .font(size: .pixel(20))
                .font(weight: .number(500))
            Headings(article.detail.intro, type: .h4)
                .margin(left: .pixel(24), top: .pixel(12), right: .pixel(24), bottom: .pixel(24))
                .foregroundColor(.textSecondary)
                .font(size: .pixel(14))
                .font(weight: .number(400))
        }
        .border(sides: [.left, .right, .bottom], width: .pixel(1), color: .hexWithHash("#F3F3F3"))
        .cornerRadius(.pixel(8))
        .margin(bottom: .pixel(24))
    }
}
