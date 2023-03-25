import Vapor

public extension Request {
    /// This is important as Vapor implements `Equatable` in a weird way considering `any`(all) type
    /// That's why we rely on `description`
    var isApp: Bool {
        let acceptsOnlyJSON = headers.accept.mediaTypes.description == [HTTPMediaType.jsonApp].description
        return acceptsOnlyJSON
    }
}

private extension HTTPMediaType {
    static let jsonApp = HTTPMediaType(type: "application", subType: "json")
}
