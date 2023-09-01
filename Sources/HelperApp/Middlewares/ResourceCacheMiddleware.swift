import Vapor

public struct ResourceCacheMiddleware: AsyncMiddleware {
    public init() {  }

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        let response = try await next.respond(to: request)
        
        try! request.application.liveRun {
            if !request.relativeURL.contains("rss.xml") {
                response.headers.cacheControl = .init(isPublic: true, maxAge: 604800) // A week
            }
        }

        return response
    }
}
