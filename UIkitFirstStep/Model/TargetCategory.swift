//
//  TargetCategory.swift
//  UIkitFirstStep
//
//  Created by andrei on 12.12.2023.
//

import Foundation

enum TargetCategory: String, CaseIterable {
    case ImportantQuickly = "Важное, срочное"
    case ImportantNotQuickly = "Важное, не срочное"
    case NotImportantQuickly = "Не важное, срочное"
    case NotImportantNotQuickly = "Не важное, не срочное"
}
