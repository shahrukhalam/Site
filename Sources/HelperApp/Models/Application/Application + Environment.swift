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

    var baseURL: String {
        let configuration = http.server.configuration
        let scheme = configuration.tlsConfiguration == nil ? "http" : "https"
        let host = configuration.hostname
        let port = configuration.port
        return isLive ? "\(scheme)://\(host)" : "\(scheme)://\(host):\(port)"
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
