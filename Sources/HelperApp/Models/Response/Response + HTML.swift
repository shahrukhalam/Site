import Vapor
import Modeling
import Pages
import HTMLDSL
import PathKit

public extension Response {
    static func html<Content: HTMLDSL.View>(for request: Request, with content: Content) -> Response {
        let response = Response()

        response.headers.contentType = .html
        try! request.application.liveRun {
            response.headers.cacheControl = .init(isPublic: true, maxAge: 31536000) // A year
        }

        response.body = .init(string: content.element)

        return response
    }
    
    static func article(for request: Request, with meta: MetaDetail, tabs: [LinkDescription], listImage: String, analyticsID: String) throws -> Response {
        let path: PathKit.Path = .init("\(request.application.contentsPath)\(request.relativeURL).md")
        let markdown: String = try path.read()
        let (title, intro, (_, bannerSource)) = try markdownParser.parse(markdown)
        let article: Article = .init(
            detail: .init(title: String(title), intro: String(intro), banner: String(bannerSource), relativeURL: request.relativeURL, absoluteURL: try request.absoluteURL),
            markdown: markdown
        )

        return .html(for: request, with: articlePage(tabs: tabs, selectedIndex: 1, article: article, meta: meta, listImage: listImage, analyticsID: analyticsID))
    }
    
    static func article(for request: Request, article: Article, with meta: MetaDetail, tabs: [LinkDescription], listImage: String, analyticsID: String) throws -> Response {
        return .html(for: request, with: articlePage(tabs: tabs, selectedIndex: 1, article: article, meta: meta, listImage: listImage, analyticsID: analyticsID))
    }

    static func articles(for request: Request, with meta: MetaDetail, tagged tags: [String], tabs: [LinkDescription], analyticsID: String) throws -> Response {
        let articles = try request.application.articles(tagged: tags)

        return .html(for: request, with: articleListPage(tabs: tabs, selectedIndex: 1, articles: articles, meta: meta, analyticsID: analyticsID))
    }
    
    static func articles(for request: Request, articles: [Article], with meta: MetaDetail, tagged tags: [String], tabs: [LinkDescription], analyticsID: String) throws -> Response {
        return .html(for: request, with: articleListPage(tabs: tabs, selectedIndex: 1, articles: articles, meta: meta, analyticsID: analyticsID))
    }
}
