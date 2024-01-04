//
//  Target.swift
//  UIkitFirstStep
//
//  Created by andrei on 12.12.2023.
//

import Foundation

struct Target: Identifiable {
    let id: String = UUID().uuidString
    let targetTitle: String
    let description: String
    let category: TargetCategory
}


//MARK: Cоздание ячейки данных где указанa: название цели, описание цели, категория которой относится цель.
