//
//  CalculatingTokenizer.swift
//  TDDCalculate
//
//  Created by tyler on 2020/02/20.
//  Copyright © 2020 Assin. All rights reserved.
//

import Foundation

protocol CalculatingTokenDelegate: class {
    func calculatingToken(command: CalCommand)
}

/**
 operand, operator 를 구분해서
 calculatingToken 를 호출합니다.
 */
internal class CalculatingTokenizer {
    
    weak var delegate: CalculatingTokenDelegate?
    
    private var operandBuffer = [CalCommand]()
    
    func token(_ char: Character) {
        
    }
}
