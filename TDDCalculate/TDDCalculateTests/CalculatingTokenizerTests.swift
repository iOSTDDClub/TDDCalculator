//
//  CalculatingTokenizerTests.swift
//  TDDCalculateTests
//
//  Created by tyler on 2020/02/23.
//  Copyright © 2020 Assin. All rights reserved.
//

import XCTest
@testable import TDDCalculate

class CalculatingTokenizerTests: XCTestCase {
    
    var subject: CalculatingTokenizer!
    var delegate: StubCalculatingTokenDelegate!
    
    override func setUp() {
        super.setUp()
        self.subject = CalculatingTokenizer()
        self.delegate = StubCalculatingTokenDelegate()
    }
    
    func testTokenOperand() {
        self.subject.token("1")
        self.subject.token("+")
        XCTAssertEqual(self.delegate.invokedCalculatingTokenCount, 2)
        XCTAssertEqual(self.delegate.invokedCalculatingTokenParametersList[0].command, CalCommand.operand("1"))
    }
}

class StubCalculatingTokenDelegate: CalculatingTokenDelegate {
    var invokedCalculatingToken = false
    var invokedCalculatingTokenCount = 0
    var invokedCalculatingTokenParameters: (command: CalCommand, Void)?
    var invokedCalculatingTokenParametersList = [(command: CalCommand, Void)]()
    func calculatingToken(command: CalCommand) {
        invokedCalculatingToken = true
        invokedCalculatingTokenCount += 1
        invokedCalculatingTokenParameters = (command, ())
        invokedCalculatingTokenParametersList.append((command, ()))
    }
}
