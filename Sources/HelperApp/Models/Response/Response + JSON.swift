import Vapor

public extension Response {
    static func json<Value: Encodable>(_ value: Value) throws -> Response {
        let response = Response()
        response.headers.contentType = .json
        let data = try JSONEncoder().encode(value)
        response.body = .init(data: data)
        return response
    }
}
