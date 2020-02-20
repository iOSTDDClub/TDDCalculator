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
    
    var subject: TDDCalculate!
    override func setUp() {
        subject = TDDCalculate()
    }

    func testPlusSum() {
        let sample = CalTestModel.sampleSum
        subject.push(sample.commands)
        XCTAssertEqual(subject.lastestResult, sample.expect)
    }
    
    func testCallResulClosure() {
        let expectation = XCTestExpectation()
        let sample = CalTestModel.sampleSum
        subject.push(sample.commands)
        subject.setResultClosure { result in
            XCTAssertEqual(result, sample.expect)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testOverflow() {
        subject.push(.operand("\(Int.max)"))
        subject.push(.operator(.plus))
        subject.push(.operand("\(Int.max)"))
        subject.push(.equals)
        XCTAssertEqual(subject.lastestResult, "18446744073709551614")
    }
}

struct CalTestModel {
    let commands: [CalCommand]
    let expect: String
}

extension CalTestModel {
    static let sampleSum = CalTestModel(commands: [.operand("1"), .operator(.plus), .operand("1"), .equals], expect: "2")
}

internal class TDDCalculate {
    private var onChangedCommand: (([CalCommand]) -> Void)? = nil
    private var calStack = [CalCommand]()
    private var onResultClosure: ((String) -> Void)?
    private var _lastestResult: String = ""
    
    private var isStackOperator: Bool = false
    func setResultClosure(complete: @escaping (String) -> Void) {
        self.onResultClosure = complete
    }
    
    func setOnChangedCommand(onChangedCommand: @escaping ([CalCommand]) -> Void) {
        self.onChangedCommand = onChangedCommand
    }
    
    func push(_ commands: [CalCommand]) {
        commands.forEach {
            self.push($0)
        }
    }
    func push(_ command: CalCommand) {
        switch command {
        case .sign:
            break
        case .allClear:
            break
        case .equals:
            while let command = calStack.popLast() {
                
            }
            break
        case .operand:
            calStack.append(command)
        case .operator:
            calStack.append(command)
        }
    }
    var lastestResult: String {
        return self._lastestResult
    }
}
