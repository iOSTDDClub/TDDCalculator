//
//  CalculatingTokenizer.swift
//  TDDCalculator
//
//  Created by tyler on 2020/02/20.
//  Copyright © 2020 Assin. All rights reserved.
//

public class TDDCalculator {

    private let calculator: InternalCalculator
    public weak var delegate: CalculatorDelegate? {
        didSet {
            self.calculator.delegate = delegate
        }
    }
    
    public init() {
        self.calculator = InternalCalculator()
    }

    public func input(_ char: Character) {
        self.calculator.calculate(char)
    }
}

