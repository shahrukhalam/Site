public struct Author {
    public struct Detail {
        public let name: String
        public let job: String
        public let location: String

        public init(name: String, job: String, location: String) {
            self.name = name
            self.job = job
            self.location = location
        }
    }

    public let detail: Detail
}
