import Foundation
import XCTest

final class StandardTest: XCTestCase {
    let cook = Cook()

    func testMultipleIngredients() {
        for ingredient in ["tuna", "olives", "corn"] {
            let result = cook.makeSalad(using: ingredient)
            XCTAssertEqual(result, "\(ingredient), tomato, lettuce, cheese")
        }
    }
}
