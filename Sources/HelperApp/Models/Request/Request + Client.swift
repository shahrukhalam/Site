import Vapor

public extension Request {
    var isApp: Bool {
        let acceptsOnlyJSON = headers.accept.mediaTypes == [.json]
        return acceptsOnlyJSON
    }
}
