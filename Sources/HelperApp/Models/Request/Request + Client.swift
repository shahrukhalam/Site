import Vapor

public extension Request {
    var isMobile: Bool {
        /// This is important as Vapor implements `Equatable` in a weird way considering `any`(all) type
        /// That's why we rely on `description`
        let acceptsOnlyJSON = headers.accept.mediaTypes.description == [HTTPMediaType.jsonMobile].description
        return acceptsOnlyJSON
    }
}

private extension HTTPMediaType {
    static let jsonMobile = HTTPMediaType(type: "application", subType: "json")
}
