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
                return .html(for: request, with: view404(tabs: tabs, selectedIndex: -1, description: description(with: Abort(status)), isApp: request.isApp), status: status)
            } else {
                return response
            }
        } catch {
            let log: String
            if let debuggableError = error as? DebuggableError {
                log = """
                ID: \(debuggableError.fullIdentifier)
                Reason: \(debuggableError.reason)
                File: \(debuggableError.source?.file ?? "")
                Function: \(debuggableError.source?.function ?? "")
                Line: \(debuggableError.source?.line.description ?? "")
                """
            } else {
                log = error.localizedDescription
            }
            request.logger.warning("\(log)")

            return .html(for: request, with: view404(tabs: tabs, selectedIndex: -1, description: description(with: error), isApp: request.isApp), status: .badRequest)
        }
    }
    
    private func description(with error: Error) -> Description {
        let reason = (error as? AbortError)?.reason ?? error.localizedDescription
        let status = (error as? AbortError) == nil ? "" : " Status: \((error as! AbortError).status.code)"
        return .init(title: reason, subtitle: "The page can't be displayed • \(status) • Reason: \(reason)")
    }
}
