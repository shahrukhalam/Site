import Vapor

public struct ResourceCacheMiddleware: AsyncMiddleware {
    public init() {  }
    
    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        let response = try await next.respond(to: request)
        
        try! request.application.liveRun {
            if request.isCacheable {
                response.headers.cacheControl = .init(isPublic: true, maxAge: 604800) // A week
            }
        }
        
        return response
    }
}

private extension Request {
    var nonCacheables: [String] {
        [
            "rss",
            "robots",
            "sitemaps/"
        ]
    }
    
    var isCacheable: Bool {
        var isCacheable: Bool = true
        for nonCacheable in nonCacheables {
            if relativeURL.contains(nonCacheable) {
                isCacheable = false
                break
            }
        }
        
        return isCacheable
    }
}
