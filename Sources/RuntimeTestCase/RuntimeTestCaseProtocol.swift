import XCTest
import ObjectiveKit

/// Protocol not using generics, to be used inside RuntimeTestCaseClass
public protocol RuntimeTestSuiteProtocol: XCTestCase {
    static var runtimeTestSuite: XCTestSuite { get }
}

/// Protocol with generics, providing the rest of the requirements and the default implementation of the testSuite
public protocol RuntimeTestCaseProtocol: RuntimeTestSuiteProtocol {
    static func testSpecs() -> [RuntimeTestCaseSpec<Self>]
}

public extension RuntimeTestCaseProtocol {
    static var runtimeTestSuite: XCTestSuite {
        let suit = XCTestSuite(forTestCaseClass: Self.self)

        for testSpec in Self.testSpecs() {
            let viewClass = ObjectiveClass<Self>()
            let selector = viewClass.addMethod(testSpec.name) { testClass in
                do {
                    try testSpec.implementation(testClass as! Self)
                } catch {
                    XCTFail("\(error)")
                }
            }

            let testClass = Self.init(selector: selector)
            suit.addTest(testClass)
        }

        return suit
    }
}
