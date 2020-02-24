//
//  TDDCalculateTests.swift
//  TDDCalculateTests
//
//  Created by Tyler on 2020/02/18.
//  Copyright © 2020 Assin. All rights reserved.
//

import XCTest
@testable import TDDCalculate

class TDDCalculateTests: XCTestCase {
    
    var subject: TDDCalculator!
    var delegate: StubCalculatorDelegate!
    
    override func setUp() {
        subject = TDDCalculator()
        delegate = StubCalculatorDelegate()
        subject.delegate = delegate
    }

    func test_TypingOperand_invokeDidTypingOperand() {
        subject.input("1")
        subject.input("2")
        XCTAssertEqual(delegate.invokedDidTypingOperandCount, 2)
        XCTAssertEqual(delegate.invokedDidTypingOperandParametersList[0].operand, "1")
        XCTAssertEqual(delegate.invokedDidTypingOperandParametersList[1].operand, "12")
    }
    
    func test_TypingOperator_invokeDidTypingOperator() {
        subject.input("1")
        subject.input("2")
        subject.input("+")
        subject.input("3")
        subject.input("=")
        
        XCTAssertEqual(delegate.invokedOnCalculateCount, 1)
        XCTAssertEqual(delegate.invokedOnCalculateParametersList[0].result, "15")
        XCTAssertEqual(delegate.invokedOnCalculateParametersList[0].command, [
            .operand("12"),
            .operator(.plus),
            .operand("3"),
            .equals
        ])
    }
}

class StubCalculatorDelegate: CalculatorDelegate {
    var invokedDidTypingOperand = false
    var invokedDidTypingOperandCount = 0
    var invokedDidTypingOperandParameters: (operand: String, Void)?
    var invokedDidTypingOperandParametersList = [(operand: String, Void)]()
    func didTypingOperand(operand: String) {
        invokedDidTypingOperand = true
        invokedDidTypingOperandCount += 1
        invokedDidTypingOperandParameters = (operand, ())
        invokedDidTypingOperandParametersList.append((operand, ()))
    }
    var invokedDidTypingOperator = false
    var invokedDidTypingOperatorCount = 0
    var invokedDidTypingOperatorParameters: (operator: CalOperator, command: [CalCommand])?
    var invokedDidTypingOperatorParametersList = [(operator: CalOperator, command: [CalCommand])]()
    func didTypingOperator(operator: CalOperator, command: [CalCommand]) {
        invokedDidTypingOperator = true
        invokedDidTypingOperatorCount += 1
        invokedDidTypingOperatorParameters = (`operator`, command)
        invokedDidTypingOperatorParametersList.append((`operator`, command))
    }
    var invokedOnCalculate = false
    var invokedOnCalculateCount = 0
    var invokedOnCalculateParameters: (result: String, command: [CalCommand])?
    var invokedOnCalculateParametersList = [(result: String, command: [CalCommand])]()
    func onCalculate(result: String, command: [CalCommand]) {
        invokedOnCalculate = true
        invokedOnCalculateCount += 1
        invokedOnCalculateParameters = (result, command)
        invokedOnCalculateParametersList.append((result, command))
    }
}
