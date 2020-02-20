//
//  CalculatingSection.swift
//  TDDCalculator
//
//  Created by tyler on 2020/02/20.
//  Copyright © 2020 Assin. All rights reserved.
//

enum CalculatingSection {
    case display
    case action
}

struct CalActionItem {
    let stride: Int
    let maxStride: Int
    let text: Int
}

struct CalDisplayItem {
    let expression: String
    let typing: String
}
