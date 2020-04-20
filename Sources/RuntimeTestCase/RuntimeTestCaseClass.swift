import XCTest

/// A class substituting the defaultTestSuite implementation
open class RuntimeTestCaseClass: XCTestCase {
    override open class var defaultTestSuite: XCTestSuite {
        if let runtimeTestCaseClass = Self.self as? RuntimeTestSuiteProtocol.Type {
            return runtimeTestCaseClass.runtimeTestSuite
        } else {
            return super.defaultTestSuite
        }
    }
}
