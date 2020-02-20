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
    public func onCalculate(command: [CalCommand]) {
        self.delegate?.onCalculate(command: command)
    }
    
    public func onCalculate(result: String) {
        self.delegate?.onCalculate(result: result)
    }
}
