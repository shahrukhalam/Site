import Vapor
import PathKit
import Modeling

public extension Application {
    func articles(tagged tags: [String]) throws -> [Article] {
        let articlesPath: PathKit.Path = .init(contentsPath) + "articles"
        var articles: [Article] = []
        for tagFolder in try articlesPath.children() {
            let tag = tagFolder.lastComponent
            guard tags.contains(tag) else { continue }

            for markdownPath in try tagFolder.children() {
                let isMarkdown = (markdownPath.extension == "md")
                guard isMarkdown else { continue }

                let name = markdownPath.lastComponentWithoutExtension
                let markdown: String = try markdownPath.read()
                let (title, intro, (_, bannerSource)) = try markdownParser.parse(markdown)
                let url = ["/articles", tag, name].joined(separator: "/")
                let article: Article = .init(
                    detail: .init(title: String(title), intro: String(intro), banner: String(bannerSource), url: url),
                    markdown: markdown
                )
                articles.append(article)
            }
        }

        return articles
    }
}
