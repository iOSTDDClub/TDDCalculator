//
//  ViewController.swift
//  TDDCalculator
//
//  Created by Tyler on 2020/02/18.
//  Copyright © 2020 Assin. All rights reserved.
//

import UIKit
import TDDCalculate

class CalculateViewController: UIViewController {

    private let viewModel: CalculateViewModel
    
    init(viewModel: CalculateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

