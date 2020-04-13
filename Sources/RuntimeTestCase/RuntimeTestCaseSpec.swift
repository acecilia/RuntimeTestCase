import Foundation

public struct RuntimeTestCaseSpec<T> {
    public let name: String
    public let implementation: (T) throws -> Void

    public init(_ name: String, _ implementation: @escaping (T) throws -> Void) {
        self.name = name
        self.implementation = implementation
    }
}
