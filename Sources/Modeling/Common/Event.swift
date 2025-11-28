public struct Event: Equatable, Hashable {
    public let name: String
    public let date: String
    public let location: String
    public let url: String
    public let description: String
    
    public init(name: String, date: String, location: String, url: String, description: String) {
        self.name = name
        self.date = date
        self.location = location
        self.url = url
        self.description = description
    }
}







