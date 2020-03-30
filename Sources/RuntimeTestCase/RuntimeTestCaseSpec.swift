import Foundation

public struct RuntimeTestCaseSpec<T> {
    public let name: String
    public let setup: (T) -> Void

    public init(_ name: String, _ setup: @escaping (T) -> Void = { _ in }) {
        self.name = name
        self.setup = setup
    }
}
