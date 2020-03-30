import XCTest

public protocol RuntimeTestCaseProtocol0 {
    static var runtimeTestSuite: XCTestSuite { get }
}

@objc
public protocol RuntimeTestCaseProtocol1 {
    @objc func runtimeTest() throws
}

public protocol RuntimeTestCaseProtocol: XCTestCase & RuntimeTestCaseProtocol0 & RuntimeTestCaseProtocol1 {
    static func testSpecs() -> [RuntimeTestCaseSpec<Self>]
}

public extension RuntimeTestCaseProtocol {
    static var runtimeTestSuite: XCTestSuite {
        let suit = XCTestSuite(forTestCaseClass: Self.self)

        for testSpec in Self.testSpecs() {
            let selector = #selector(Self.runtimeTest).customize(name: testSpec.name, Self.self)
            let testClass = Self.init(selector: selector)
            testSpec.setup(testClass)
            suit.addTest(testClass)
        }

        return suit
    }
}

private extension Selector {
    func customize(name: String, _ target: AnyClass) -> Selector {
        let method = class_getInstanceMethod(target, self)!
        let customSelector = Selector(name)
        class_addMethod(target, Selector(name), method_getImplementation(method), method_getTypeEncoding(method))
        return customSelector
    }
}
