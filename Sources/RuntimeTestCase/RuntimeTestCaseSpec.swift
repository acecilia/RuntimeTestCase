import Foundation

public struct RuntimeTestCaseSpec<T> {
    let name: String
    let setup: (T) -> Void

    init(_ name: String, _ setup: @escaping (T) -> Void = { _ in }) {
        self.name = name
        self.setup = setup
    }
}
