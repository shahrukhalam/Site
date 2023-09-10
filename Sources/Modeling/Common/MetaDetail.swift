public struct MetaDetail {
    public let title: String
    public let description: String
    public let absoluteSocialImage: String
    public let absoluteURL: String
    public let isIndexable: Bool

    public init(title: String, description: String, absoluteSocialImage: String, absoluteURL: String, isIndexable: Bool) {
        self.title = title
        self.description = description
        self.absoluteSocialImage = absoluteSocialImage
        self.absoluteURL = absoluteURL
        self.isIndexable = isIndexable
    }
}
