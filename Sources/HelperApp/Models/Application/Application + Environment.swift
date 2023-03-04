import Vapor

public extension Application {
    func liveRun(task: () throws -> Void) throws {
        switch environment.isRelease {
        case true:
            try task()
        case false:
            break
        }
    }

    func testRun(task: () throws -> Void) throws {
        switch environment.isRelease {
        case true:
            break
        case false:
            try task()
        }
    }

    var contentsPath: String {
        switch environment.isRelease {
        case true:
            return "Contents"
        case false:
            return "Sources/App/Contents"
        }
    }
}
