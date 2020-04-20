import Foundation

/// A specification for a runtime test case
public struct RuntimeTestCaseSpec<T> {
    /// The test name to be used
    public let name: String
    /// The test implementation
    public let implementation: (T) throws -> Void

    public init(_ name: String, _ implementation: @escaping (T) throws -> Void) {
        self.name = name
        self.implementation = implementation
    }
}
