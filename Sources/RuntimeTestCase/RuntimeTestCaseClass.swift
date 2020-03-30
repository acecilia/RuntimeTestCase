import XCTest

public class RuntimeTestCaseClass: XCTestCase {
    override public class var defaultTestSuite: XCTestSuite {
        if let runtimeTestCaseClass = Self.self as? RuntimeTestCaseProtocol0.Type {
            return runtimeTestCaseClass.runtimeTestSuite
        } else {
            fatalError("The test suite for generating runtime tests could not be found")
        }
    }
}
