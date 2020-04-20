import Foundation
import XCTest
import RuntimeTestCase

final class RuntimeTest: RuntimeTestCase {
    static func testSpecs() -> [RuntimeTestCaseSpec<RuntimeTest>] {
        return ["tuna", "olives", "corn"].map { ingredient in
            RuntimeTestCaseSpec("test\(ingredient.capitalized)") { testCase in
                testCase.test(ingredient)
            }
        }
    }

    let cook = Cook()

    func test(_ ingredient: String) {
        let result = cook.makeSalad(using: ingredient)
        XCTAssertEqual(result, "\(ingredient), tomato, lettuce, cheese")
    }
}
