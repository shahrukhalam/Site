import Vapor

public extension Request {
    func urlRoute(live host: String) -> String {
        application.baseURL(live: host) + url.path
    }
}
