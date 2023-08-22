import Vapor
import Modeling
import Pages
import HTMLDSL

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
    
    static func html<Content: HTMLDSL.View>(for request: Request, with content: Content, status: HTTPResponseStatus) -> Response {
        let response = Response(status: status)
        
        response.headers.contentType = .html

        response.body = .init(string: content.element)

        return response
    }
    
    static func article(for request: Request, article: Article, with meta: MetaDetail, tabs: [LinkDescription], listImage: String, analyticsID: String) throws -> Response {
        return .html(for: request, with: articlePage(tabs: tabs, selectedIndex: 1, article: article, meta: meta, listImage: listImage, analyticsID: analyticsID, isApp: request.isApp))
    }
    
    static func articles(for request: Request, articles: [Article], with meta: MetaDetail, tabs: [LinkDescription], analyticsID: String) throws -> Response {
        return .html(for: request, with: articleListPage(tabs: tabs, selectedIndex: 1, articles: articles, meta: meta, analyticsID: analyticsID))
    }
}
