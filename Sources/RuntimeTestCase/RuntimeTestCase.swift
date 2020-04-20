import XCTest

/// The RuntimeTestCase has some protocol requirements and needs to override the default defaultTestSuite implementation
public typealias RuntimeTestCase = RuntimeTestCaseClass & RuntimeTestCaseProtocol

