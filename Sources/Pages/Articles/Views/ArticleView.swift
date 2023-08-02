//
//  ArticleView.swift
//  
//
//  Created by Shahrukh Alam on 09/08/22.
//

import Modeling
import HTMLDSL

/// Local: `5646122693427200-proj`
/// Live: `5721215717081088-proj`
let commentBox = """
    <div class="commentbox"></div>
    <script src="https://unpkg.com/commentbox.io/dist/commentBox.min.js"></script>
    <script>commentBox('5721215717081088-proj', { sortOrder: 'newest' })</script>
"""

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
                        .margin(top: .length(.relativeToRoot(Typography.Margin.title)))
                }
                
                Div {
                    Paragraphs("This is a free third party commenting service we are using for you, which needs you to sign in to post a comment, but the good bit is you can stay anonymous while commenting.")
                        .foregroundColor(Color.Dark.ActiveNavBarItem)
                        .font(size: .relativeToRootFontSize(Typography.Font.Size.byline))
                        .font(weight: .number(Typography.Font.Weight.byline))
                        .margin(bottom: .length(.relativeToRoot(Typography.Margin.byline)))
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
        Paragraphs(
            "Thanks for reading 🚀" +
                .lineBreak +
            "If you have questions/suggestion, please add a comment below 👁️‍🗨️" +
                .lineBreak +
            "If you liked this article, please share it with your friends and fellow iOS Developers 🙏"
        )
            .foregroundColor(.Light.ArticleText)

        Div {
            ImageLink(url: "https://twitter.com/intent/tweet?text=I recommend \(title) by Shahrukh Alam \(url)", content: {
                Image("/images/articles/twitter.png", alternateText: "twitter icon")
                Paragraphs("Share this article on Twitter")
                    .padding(left: .length(.relativeToRoot(Typography.Margin.body)))
            })
            .target(.newWindowOrTab)
            .padding(
                top: .length(.relativeToRoot(Typography.Margin.byline)),
                bottom: .length(.relativeToRoot(Typography.Margin.byline))
            )
        }
        .margin(
            top: .length(.relativeToRoot(Typography.Margin.byline))
        )

        Div {
            ImageLink(url: "https://www.linkedin.com/sharing/share-offsite/?url=\(url)", content: {
                Image("/images/articles/linkedin.png", alternateText: "linkedin icon")
                Paragraphs("Share this article on Linkedin")
                    .padding(left: .length(.relativeToRoot(Typography.Margin.body)))
            })
            .target(.newWindowOrTab)
            .padding(
                top: .length(.relativeToRoot(Typography.Margin.byline)),
                bottom: .length(.relativeToRoot(Typography.Margin.byline))
            )
        }
    }
    .identifyBy(cssClass: .share)
}
