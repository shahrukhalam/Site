import Vapor

public struct ResourceCacheMiddleware: AsyncMiddleware {
    public init() {  }

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        let response = try await next.respond(to: request)
        if request.application.isLive {
            response.headers.cacheControl = .init(isPublic: true, maxAge: 31536000) // A year
        }
        return response
    }
}
