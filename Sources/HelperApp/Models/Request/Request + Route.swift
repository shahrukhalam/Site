import Vapor

public extension Request {
    var urlRoute: String {
        application.baseURL + url.path
    }
}
