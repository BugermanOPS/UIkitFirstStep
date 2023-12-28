//
//  TextFieldExtension.swift
//  UIkitFirstStep
//
//  Created by andrei on 02.12.2023.
//

import UIKit

extension UITextField {
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        font = .systemFont(ofSize: 18)
//        borderStyle = .none
        backgroundColor = .white
        layer.cornerRadius = 23
        layer.masksToBounds = true
        heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        //MARK: Создание границ. Окрас серым цветом.
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        
        //MARK: Cмещение текста в UITextField от левого края.
        leftView = UIView(frame: .init(x: 0, y: 0, width: 15, height: 0))
        leftViewMode = .always
    }
}




