//
//  ArticleView.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import Modeling
import HTMLDSL

struct ArticleView: HTMLBodyContentView {
    var tag: Tag = .empty
    var attributes = [Attribute]()
    
    private let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var body: some View {
        Div {
            Div {
                Markdown(article.markdown)
                    .identifyBy(cssClass: .markdown)
                share(title: article.detail.title, url: article.detail.absoluteURL)
            }
            .identifyBy(cssClass: .markdownContainer)
        }
        .identifyBy(cssClass: .article)
    }
}

var shareStyle: CSSStyle {
    let pStyle = ClassStyle(forClass: .share, withTag: .enclosing(.paragraph))
        .padding(top: .pixel(10), bottom: .pixel(10))
        .font(size: .percentage(125))
        .lineHeight(.percentage(160))
    let linkStyle = ClassStyle(forClass: .share, withTag: .enclosing(.link))
        .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
        .textDecoration(.none)
    let linkHoverStyle = ClassStyle(.share, tag: .enclosing(.link), cssTag: .hover)
        .foregroundColor(isDarkMode ? Color.Dark.LinkNormalForeground : Color.Light.LinkNormalForeground)
        .textDecoration(.underline)
    return [pStyle, linkStyle, linkHoverStyle]
}

private func share(title: String, url: String) -> some HTMLBodyContentView {
    Div {
        Paragraphs("Thanks for reading 🚀" + .lineBreak + "If you liked this article, please share it with your friends and fellow iOS Developers 🙏")

        ImageLink(url: "https://twitter.com/intent/tweet?text=I recommend \(title) by Shahrukh Alam \(url)", content: {
            Image("/images/articles/twitter.png", alternateText: "twitter icon")
            Paragraphs("Share this article on Twitter")
                .display(.inline)
        })
        .display(.block)
        .target(.newWindowOrTab)

        ImageLink(url: "https://www.linkedin.com/sharing/share-offsite/?url=\(url)", content: {
            Image("/images/articles/linkedin.png", alternateText: "linkedin icon")
            Paragraphs("Share this article on Linkedin")
                .display(.inline)
        })
        .display(.block)
        .target(.newWindowOrTab)
    }
    .identifyBy(cssClass: .share)
}
