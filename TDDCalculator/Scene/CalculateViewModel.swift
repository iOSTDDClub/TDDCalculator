//
//  CalculateViewModel.swift
//  TDDCalculator
//
//  Created by tyler on 2020/02/20.
//  Copyright © 2020 Assin. All rights reserved.
//

import RxSwift
import RxCocoa
import TDDCalculate



class CalculateViewModel {
    private var disposeBag = DisposeBag()
    let inTyping = PublishRelay<String>()
    private let lastestResult = BehaviorRelay<String>(value: "")
    let onDisplayTypingText = BehaviorRelay<String>(value: "0")
    let onExpressionText = BehaviorRelay<String>(value: "")
    private let calculator: TDDCalculator
    
    
    init() {
        self.calculator = TDDCalculator()
        self.calculator.delegate = self
        self.inTyping
            .subscribe(onNext: { [weak self] text in
                // 한글자씩 전달된다.
                self?.calculator.input(text)
            })
            .disposed(by: self.disposeBag)
    }
}

extension CalculateViewModel: CalculatorDelegate {
    func didTypingOperator(operator: CalOperator, command: [CalCommand]) {
        self.onExpressionText.accept(command.displayExpression())
    }
    
    func didTypingOperand(operand: String) {
        self.onDisplayTypingText.accept(operand)
    }
    
    func onCalculate(result: String, command: [CalCommand]) {
        self.onDisplayTypingText.accept(result)
        self.lastestResult.accept(result)
    }
}

private extension Array where Element == CalCommand {
    func displayExpression() -> String {
        return ""
    }
}
