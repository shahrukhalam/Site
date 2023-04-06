public struct ImageDescription: Codable, Equatable {
    public let url: String
    public let description: String
    public let aspectRatio: AspectRatio

    public init(url: String, description: String, aspectRatio: AspectRatio) {
        self.url = url
        self.description = description
        self.aspectRatio = aspectRatio
    }
}

public struct AspectRatio: Codable, Equatable {
    public let width: Int
    public let height: Int

    public init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
}
