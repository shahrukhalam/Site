import Vapor

public extension Response {
    static func json<Value: Encodable>(_ value: Value) throws -> Response {
        let response = Response()
        response.headers.contentType = .json
        let data = try JSONEncoder().encode(value)
        response.body = .init(data: data)
        return response
    }

    static func json(_ value: String) throws -> Response {
        let response = Response()
        response.headers.contentType = .json

        guard let data = value.data(using: .utf8) else {
            throw Abort(.partialContent, reason: "Failed to convert String to Data")
        }

        response.body = .init(data: data)
        return response
    }
}
