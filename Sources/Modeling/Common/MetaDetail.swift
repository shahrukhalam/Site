public struct MetaDetail {
    public let title: String
    public let description: String
    public let absoluteSocialImage: String
    public let absoluteURL: String
    public let canonicalURL: String

    public init(title: String, description: String, absoluteSocialImage: String, absoluteURL: String, canonicalURL: String) {
        self.title = title
        self.description = description
        self.absoluteSocialImage = absoluteSocialImage
        self.absoluteURL = absoluteURL
        self.canonicalURL = canonicalURL
    }
}
