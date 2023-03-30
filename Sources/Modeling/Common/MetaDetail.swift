public struct MetaDetail {
    public let title: String
    public let description: String
    public let keywords: Set<String>
    public let absoluteSocialImage: String
    public let absoluteURL: String

    public init(title: String, description: String, keywords: Set<String>, absoluteSocialImage: String, absoluteURL: String) {
        self.title = title
        self.description = description
        self.keywords = keywords
        self.absoluteSocialImage = absoluteSocialImage
        self.absoluteURL = absoluteURL
    }
}
