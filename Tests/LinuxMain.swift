import XCTest

import RuntimeTestCaseTests

var tests = [XCTestCaseEntry]()
tests += RuntimeTestCaseTests.__allTests()

XCTMain(tests)
