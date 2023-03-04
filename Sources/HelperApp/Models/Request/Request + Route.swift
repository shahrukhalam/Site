import Vapor

public extension String {
    static var DOMAIN_HOST: Self { #function }
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
            guard let host = Environment.get(.DOMAIN_HOST) else {
                throw RequestError.domainHostNotAvailable
            }

            return headers.first(name: .host) ?? headers.first(name: ":authority") ?? host
        }
    }
    
    var urlRoute: String {
        get throws {
            let baseURL = try baseURL
            return baseURL + url.path
        }
    }
}
