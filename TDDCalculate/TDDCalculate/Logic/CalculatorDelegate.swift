//
//  CalculatorDelegate.swift
//  TDDCalculate
//
//  Created by tyler on 2020/02/20.
//  Copyright © 2020 Assin. All rights reserved.
//

import Foundation

public protocol CalculatorDelegate: class {
    func didTypingOperand(operand: String)
    func didTypingOperator(operator: CalOperator, command: [CalCommand])
    func onCalculate(result: String, command: [CalCommand])
}
