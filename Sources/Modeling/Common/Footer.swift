public struct Footer {
    public struct Section {
        public let name: String
        public let subsections: [LinkDescription]
        
        public init(name: String, subsections: [LinkDescription]) {
            self.name = name
            self.subsections = subsections
        }
    }
    
    public let copyright: String
    public let sections: [Section]

    public init(copyright: String, sections: [Section]) {
        self.copyright = copyright
        self.sections = sections
    }
}
