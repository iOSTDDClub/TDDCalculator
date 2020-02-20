//
//  InternalCalculator.swift
//  TDDCalculate
//
//  Created by tyler on 2020/02/20.
//  Copyright © 2020 Assin. All rights reserved.
//


internal class InternalCalculator {

    private let tokenizer: CalculatingTokenizer

    init() {
        self.tokenizer = CalculatingTokenizer()
    }
    private func commandCalculate(command: CalCommand) {
        switch command {
        case .allClear:
            break
        case .operand(let digit):
            break
        case .operator(let oper):
            break
        case .equals:
            break
        case .sign:
            break
        }
    }

    func calculate(text: String) {
        self.tokenizer.token(text)
    }
}

extension InternalCalculator: CalculatingTokenDelegate {
    func calculatingToken(command: CalCommand) {
        self.commandCalculate(command: command)
    }
}
