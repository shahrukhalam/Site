import Vapor
import Pages
import HTMLDSL
import Modeling

public struct Middleware404: AsyncMiddleware {
    private let tabs: [LinkDescription]

    public init(tabs: [LinkDescription]) {
        self.tabs = tabs
    }

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        do {
            let response = try await next.respond(to: request)
            let status = response.status
            let code = status.code
            if code >= HTTPResponseStatus.badRequest.code {
                return .html(for: request, with: view404(tabs: tabs, selectedIndex: -1, description: description(with: Abort(status))))
            } else {
                return response
            }
        } catch {
            return .html(for: request, with: view404(tabs: tabs, selectedIndex: -1, description: description(with: error)))
        }
    }
    
    private func description(with error: Error) -> Description {
        let reason = (error as? AbortError)?.reason ?? error.localizedDescription
        let status = (error as? AbortError) == nil ? "" : " Status: \((error as! AbortError).status.code)"
        return .init(title: reason, subtitle: "The page can't be displayed • \(status) • Reason: \(reason)")
    }
}
