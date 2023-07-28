import Vapor

private extension String {
    static var DOMAIN_HOST: Self { #function }
}

private extension HTTPHeaders.Name {
    /// HTTP or HTTPS Fly Forwarded Header.
    static let flyForwardedProto = Self("fly-forwarded-proto")
    /// HTTP or HTTPS Fly Forwarded Header.
    /// `on` or `off`
    static let flyForwardedSSL = Self("fly-forwarded-ssl")

    /// HTTP or HTTPS Browser Forwarded Header.
    /// `on` or `off`
    static let xForwardedSSL = Self("x-forwarded-ssl")
}

public extension Request {
    private enum RequestError: LocalizedError {
        case domainHostNotAvailable

        var errorDescription: String? {
            switch self {
            case .domainHostNotAvailable:
                return "Couldn't get an Environment variable for the key domain_host, this is important for a fallback in case host is not received from headers sent from Browser."
            }
        }
    }

    var baseURL: String {
        get throws {
            let scheme = isSecure ? "https" : "http"
            let host = headers.first(name: .host) ?? headers.first(name: ":authority")
            guard host == nil else {
                return scheme + "://" + host!
            }
            
            guard let fallbackHost = Environment.get(.DOMAIN_HOST) else {
                throw RequestError.domainHostNotAvailable
            }
            
            return scheme + "://" + fallbackHost
        }
    }

    var domainHost: String {
        get throws {
            let scheme = isSecure ? "https" : "http"

            let fallbackHost = Environment.get(.DOMAIN_HOST)
            let host = headers.first(name: .host) ?? headers.first(name: ":authority") ?? "127.0.0.1:8080"

            return scheme + "://" + (fallbackHost ?? host)
        }
    }
    
    var absoluteURL: String {
        get throws {
            let baseURL = try baseURL
            return baseURL + relativeURL
        }
    }
    
    var relativeURL: String { url.path }

    private var isSecure: Bool {
        let proto = headers.first(name: .flyForwardedProto) ?? headers.first(name: .xForwardedProto)
        if let proto = proto {
            return proto == "https"
        }

        let ssl = headers.first(name: .flyForwardedSSL) ?? headers.first(name: .xForwardedSSL)
        if let ssl = ssl {
            return ssl == "on"
        }

        return false
    }
}
