//
//  SignOperator+.swift
//  TDDCalculator
//
//  Created by tyler on 2020/02/18.
//  Copyright © 2020 Assin. All rights reserved.
//

import TDDCalculate

extension SignOperator {
    public var presentDescription: String {
        switch self {
        case .plus:
            return "+"
        case .minus:
            return "−"
        case .divide:
            return "÷"
        case .remainder:
            return "%"
        case .sign:
            return "±"
        case .multiply:
            return "×"
        case .calculate:
            return "="
        }
    }
}

