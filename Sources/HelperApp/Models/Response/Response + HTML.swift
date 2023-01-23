import Vapor
import Modeling
import Pages
import HTMLDSL
import PathKit

public extension Response {
    static func html<Content: HTMLDSL.View>(for request: Request, with content: Content) -> Response {
        let response = Response()

        response.headers.contentType = .html
        if request.application.isLive {
            response.headers.cacheControl = .init(isPublic: true, maxAge: 604800) // A week
        }

        response.body = .init(string: content.element)

        return response
    }
    
    static func article(for request: Request, live host: String, with meta: MetaDetail, tabs: [LinkDescription], listImage: String) throws -> Response {
        let path: PathKit.Path = .init("\(request.application.contentsPath)\(request.url.path).md")
        let markdown: String = try path.read()
        let (title, intro, (_, bannerSource)) = try markdownParser.parse(markdown)
        let article: Article = .init(markdown: markdown, title: String(title), intro: String(intro), banner: String(bannerSource), url: request.urlRoute(live: host))

        return .html(for: request, with: articlePage(tabs: tabs, selectedIndex: 1, article: article, meta: meta, listImage: listImage))
    }

    static func articles(for request: Request, live host: String, with meta: MetaDetail, tagged tags: [String], tabs: [LinkDescription]) throws -> Response {
        let articles = try request.application.articles(tagged: tags, live: host)

        return .html(for: request, with: articleListPage(tabs: tabs, selectedIndex: 1, articles: articles, meta: meta))
    }
}
