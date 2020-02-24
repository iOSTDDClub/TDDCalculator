//
//  CalculatorDelegate.swift
//  TDDCalculate
//
//  Created by tyler on 2020/02/20.
//  Copyright © 2020 Assin. All rights reserved.
//

import Foundation

public protocol CalculatorDelegate: class {
    /**
     Operand 가 타이핑될때마다 호출된다.
     */
    func didTypingOperand(operand: String)
    /**
    Operator가 타이핑될때 호출된다.
    */
    func didTypingOperator(operator: CalOperator, command: [CalCommand])
    /**
    계산 (=) 입력되어서 계산식이 완성되었을때 호출된다.
    */
    func onCalculate(result: String, command: [CalCommand])
}
