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
    let onResult = BehaviorRelay<String>(value: "")
    let onDisplayText = BehaviorRelay<String>(value: "")
    private let calculator: TDDCalculateProtocol
    
    init() {
        self.calculator = TDDCalculator()
        self.inTyping
            .subscribe(onNext: { [weak self] text in
                // 한글자씩 전달된다.
                self?.calculator.input(text)
            })
            .disposed(by: self.disposeBag)
    }
}

extension CalculateViewModel: CalculatorDelegate {
    func onCalculate(command: [CalCommand]) {
        onDisplayText.accept(command.displayText())
    }
    
    
    func onCalculate(result: String) {
        self.onResult.accept(result)
    }
    
}

private extension Array where Element == CalCommand {
    func displayText() -> String {
        return ""
    }
}
