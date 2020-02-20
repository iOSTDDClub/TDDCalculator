//
//  CalculatingTokenizer.swift
//  TDDCalculator
//
//  Created by tyler on 2020/02/20.
//  Copyright © 2020 Assin. All rights reserved.
//

public class TDDCalculator {

    private let calculator: InternalCalculator
    public weak var delegate: CalculatorDelegate?
    
    public init() {
        self.calculator = InternalCalculator()
        self.calculator.delegate = delegate
    }

    public func input(_ text: String) {
        self.calculator.calculate(text: text)
    }
}
