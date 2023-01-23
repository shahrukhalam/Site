import Vapor

extension Application {
    var isLive: Bool {
        switch environment {
        case .production:
            return true
        default:
            return false
        }
    }

    func baseURL(live host: String) -> String {
        switch isLive {
        case true:
            return host
        case false:
            return "http://127.0.0.1:8080"
        }
    }

    var contentsPath: String {
        switch isLive {
        case true:
            return "Contents"
        case false:
            return "Sources/App/Contents"
        }
    }
}
