public struct Author {
    public struct Detail {
        public let name: String
        public let role: String
        public let location: String

        public init(name: String, role: String, location: String) {
            self.name = name
            self.role = role
            self.location = location
        }
    }

    public let detail: Detail
}
