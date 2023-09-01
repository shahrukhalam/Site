import Vapor

public struct RedirectionMiddleware: AsyncMiddleware {
    public init() {  }

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        let baseURL = try request.baseURL
        let domainHost = try request.domainHost
        
        guard baseURL == domainHost else {
            return request.redirect(to: domainHost + request.relativeURL)
        }
        
        return try await next.respond(to: request)
    }
}
