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
        subject.append(operator: .plus, operand: "1")
        subject.append(operator: .calculate, operand: "1")
        XCTAssertEqual(subject.calculate(), "2")
    }
    
    func testCallPrintClosure() {
        let expectation = XCTestExpectation()
        subject.append(operator: .plus, operand: "1")
        
        subject.setPrintClosure { print in
            XCTAssertEqual(print, "1 +")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func testOverflow() {
        subject.append(operator: .plus, operand: "\(Int.max)")
        subject.append(operator: .calculate, operand: "\(Int.max)")
        XCTAssertEqual(subject.calculate(), "18446744073709551614")
    }
}

class TDDCalculate {
    private var printClosure: ((String) -> Void)? = nil
    
    init(printClosure: ((String) -> Void)? = nil) {
        self.printClosure = printClosure
    }
    
    func setPrintClosure(printClosure: @escaping (String) -> Void) {
        self.printClosure = printClosure
    }
    
    func append(operator: SignOperator, operand: String) {
        
    }
    
    func calculate() -> String {
        return ""
    }
}
