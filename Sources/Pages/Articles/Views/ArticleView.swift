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
                Div {
                    Headings(article.detail.title, type: .h1)
                    BylineView(bylines: article.detail.bylines)
                }
                .identifyBy(cssClass: .markdown)

                Markdown(article.markdown)
                    .identifyBy(cssClass: .markdown)
                if article.isSharable {
                    share(title: article.detail.title, url: article.absoluteURL)
                        .margin(top: .length(.relativeToRoot(Typography.Margin.heading1)))
                }
            }
            .identifyBy(cssClass: .markdownContainer)
        }
        .identifyBy(cssClass: .article)
    }
}

var shareStyle: CSSStyle {
    let pStyle = ClassStyle(forClass: .share, withTag: .enclosing(.paragraph))
        .font(size: .relativeToRootFontSize(Typography.Font.Size.body))
        .lineHeight(.number(Typography.LineHeight.body))

    let linkStyle = ClassStyle(forClass: .share, withTag: .enclosing(.link))
        .display(.inlineFlex)
        .flexDistribute(.center)
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
            .foregroundColor(.Light.ArticleText)

        Div {
            ImageLink(url: "https://twitter.com/intent/tweet?text=I recommend \(title) by Shahrukh Alam \(url)", content: {
                Image("/images/articles/twitter.png", alternateText: "twitter icon")
                Paragraphs("Share this article on Twitter")
                    .padding(left: .length(.relativeToRoot(Typography.Margin.body)))
            })
            .target(.newWindowOrTab)
        }

        Div {
            ImageLink(url: "https://www.linkedin.com/sharing/share-offsite/?url=\(url)", content: {
                Image("/images/articles/linkedin.png", alternateText: "linkedin icon")
                Paragraphs("Share this article on Linkedin")
                    .padding(left: .length(.relativeToRoot(Typography.Margin.body)))
            })
            .target(.newWindowOrTab)
        }
    }
    .identifyBy(cssClass: .share)
}
