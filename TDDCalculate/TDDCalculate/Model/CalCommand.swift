//
//  CalCommand.swift
//  TDDCalculate
//
//  Created by tyler on 2020/02/18.
//  Copyright © 2020 Assin. All rights reserved.
//

public enum CalCommand: Equatable {
    case operand(String)
    case `operator`(CalOperator)
    case equals
    case allClear
    case sign
}
