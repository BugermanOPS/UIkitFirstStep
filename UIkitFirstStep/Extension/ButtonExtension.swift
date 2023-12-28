//
//  ButtonExtension.swift
//  UIkitFirstStep
//
//  Created by andrei on 08.12.2023.
//

import Foundation
import UIKit

extension UIButton {
    convenience init (sfSymbol: String) {
        self.init()
        
        let config = UIImage.SymbolConfiguration(
            pointSize: 26, weight: .medium, scale: .default)
        let image = UIImage(systemName: sfSymbol, withConfiguration: config)
        
        setImage(image, for: .normal)
       
        tintColor = UIColor.white
        
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        widthAnchor.constraint(equalToConstant: 50).isActive = true
       
        layer.cornerRadius = 25
        layer.borderWidth = 3
     
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = UIColor(named: "bgColor")
    }
}




