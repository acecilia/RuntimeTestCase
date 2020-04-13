import XCTest
import ObjectiveKit

public protocol RuntimeTestSuiteProtocol {
    static var runtimeTestSuite: XCTestSuite { get }
}

public protocol RuntimeTestCaseProtocol: XCTestCase & RuntimeTestSuiteProtocol {
    static var runtimeTestSuite: XCTestSuite { get }
    static func testSpecs() -> [RuntimeTestCaseSpec<Self>]
}

public extension RuntimeTestCaseProtocol {
    static var runtimeTestSuite: XCTestSuite {
        let suit = XCTestSuite(forTestCaseClass: Self.self)

        for testSpec in Self.testSpecs() {
            // Create methods
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
