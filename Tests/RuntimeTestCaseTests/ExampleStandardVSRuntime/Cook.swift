import Foundation

class Cook {
    func makeSalad(using ingredient: String) -> String {
        return [ingredient, "tomato", "lettuce", "cheese"].joined(separator: ", ")
    }
}
