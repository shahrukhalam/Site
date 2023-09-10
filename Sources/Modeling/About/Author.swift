public struct Author {
    public struct Detail {
        public let name: String
        public let role: Role

        public init(name: String, role: Role) {
            self.name = name
            self.role = role
        }
        
        public struct Role: OptionSet {
            public let rawValue: Int

            public init(rawValue: Int) {
                self.rawValue = rawValue
            }
                        
            public static let coauthor: Role = .init(rawValue: 1 << 0)
            public static let creator: Role = .init(rawValue: 1 << 1)
            public static let all: Role = [creator, .coauthor]
        }
    }

    public let detail: Detail
    public let url: String
    
    public init(detail: Author.Detail, url: String) {
        self.detail = detail
        self.url = url
    }
}

extension Author.Detail.Role: CustomStringConvertible {
    public var description: String {
        switch self {
        case .creator:
            return "creator"
        case .coauthor:
            return "coauthor"
        case .all:
            return "creator & coauthor"
        default:
            fatalError("Unexpected Role at this point")
        }
    }
}
