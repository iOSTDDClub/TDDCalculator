//
//  SignOperator.swift
//  TDDCalculate
//
//  Created by tyler on 2020/02/18.
//  Copyright © 2020 Assin. All rights reserved.
//

import Foundation

public enum CalOperator {
    case plus
    case minus
    case multiply
    case divide
    case remainder
}

extension CalOperator: CustomStringConvertible {
    public var description: String {
        switch self {
        case .plus:
            return "+"
        case .minus:
            return "−"
        case .divide:
            return "÷"
        case .remainder:
            return "%"
        case .multiply:
            return "×"
        }
    }
}
