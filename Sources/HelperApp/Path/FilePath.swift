import Foundation

public struct FilePath {
    static let separator = "/"
    
    fileprivate let path: String
    fileprivate var url: URL { URL(fileURLWithPath: path) }
    
    private static let fileManager = FileManager.default
    
    public init(_ path: String) { self.path = path }
}

// MARK: ExpressibleByStringLiteral

extension FilePath : ExpressibleByStringLiteral {
    public init(stringLiteral value: String) { self.init(value) }
}

// MARK: Directory

public extension FilePath {
    static var current: Self { .init(fileManager.currentDirectoryPath) }
}

// MARK: Contents

public extension FilePath {
    func read(_ encoding: String.Encoding = .utf8) throws -> String {
        try .init(contentsOfFile: path, encoding: encoding)
    }
    
    func write(_ string: String, encoding: String.Encoding = .utf8) throws {
        try string.write(toFile: path, atomically: true, encoding: encoding)
    }
}

// MARK: Operators

public func +(lhs: FilePath, rhs: FilePath) -> FilePath { lhs.path + rhs.path }

public func +(lhs: FilePath, rhs: String) -> FilePath { lhs.path + rhs }

public func +(lhs: String, rhs: FilePath) -> FilePath { lhs + rhs.path }

fileprivate func +(lhs: String, rhs: String) -> FilePath { .init(lhs + FilePath.separator + rhs) }
