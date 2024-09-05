func share(title: String, url: String) -> some HTMLBodyContentView {
    Div {
        Paragraphs(
            "Thanks for reading 🚀" +
                .lineBreak +
            "If you have questions/suggestion, please add a comment below 👁️‍🗨️" +
                .lineBreak +
            "If you liked this article, please share it with your friends and fellow Developers 🙏"
        )

        Div {
            ImageLink(url: "https://twitter.com/intent/tweet?text=I recommend \(title) by Shahrukh Alam \(url)", content: {
                Image("/images/articles/twitter.png", alternateText: "twitter icon")
                    .contentMode(.aspectFit)
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
                    .contentMode(.aspectFit)
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
