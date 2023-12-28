//
//  TargetSection.swift
//  UIkitFirstStep
//
//  Created by andrei on 12.12.2023.
//
import Foundation

struct TargetSection: Identifiable {
    let id: String = UUID().uuidString
    let category: TargetCategory
    var target: [Target]
}
