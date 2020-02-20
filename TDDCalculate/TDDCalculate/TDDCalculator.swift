//
//  CalculatingTokenizer.swift
//  TDDCalculator
//
//  Created by tyler on 2020/02/20.
//  Copyright © 2020 Assin. All rights reserved.
//

public protocol TDDCalculateProtocol: class {
    func input(_ text: String)
}

public class TDDCalculator: TDDCalculateProtocol {

    private let calculator: InternalCalculator
    weak var delegate: CalculatorDelegate?
    
    public init() {
        self.calculator = InternalCalculator()
    }

    public func input(_ text: String) {
        self.calculator.calculate(text: text)
    }
}

extension TDDCalculator: CalculatorDelegate {
    public func didTypingOperand(operand: String) {
        self.delegate?.didTypingOperand(operand: operand)
    }
    
    public func didTypingOperator(operator: CalOperator, command: [CalCommand]) {
        self.delegate?.didTypingOperator(operator: `operator`, command: command)
    }
    
    public func onCalculate(result: String, command: [CalCommand]) {
        self.delegate?.onCalculate(result: result, command: command)
    }
}
