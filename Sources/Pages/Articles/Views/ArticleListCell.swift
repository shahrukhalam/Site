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
        let image = AnyView(
            Div {
                Image(article.detail.banner, alternateText: "Swift logo")
                    .size(width: .percentage(100))
                    .aspectRatio(width: 16, height: 9)
                    .contentMode(.aspectFill)
                    .cornerRadius(.pixel(8))
            }
                .identifyBy(cssClass: .gridItem1By3)
        )

        let detail = AnyView(
            Div {
                Div {
                    Link(text: article.detail.title, url: article.relativeURL)
                        .identifyBy(cssClasses: [.link])
                }
                .margin(bottom: .length(.relativeToRoot(Typography.Margin.body)))
                
                Headings(article.detail.intro, type: .h4)
            }
                .identifyBy(cssClass: .gridItem2By3)
        )

        return Div {
            image
            detail
        }
        .identifyBy(cssClass: .gridContainer)
        .margin(bottom: .length(.relativeToRoot(Typography.Margin.title)))
    }
}
