public struct ImageDescription {
    public let url: String
    public let description: String
    public let aspectRatio: (width: Int, height: Int)

    public init(url: String, description: String, aspectRatio: (width: Int, height: Int)) {
        self.url = url
        self.description = description
        self.aspectRatio = aspectRatio
    }
}
