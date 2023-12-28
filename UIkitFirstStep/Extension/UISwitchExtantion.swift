//
//  UISwitchExtantion.swift
//  UIkitFirstStep
//
//  Created by andrei on 02.12.2023.
//

import UIKit

extension UISwitch {
    convenience init(color: CGColor) {
            self.init()
           
            //MARK: установка элемента switch вложения false
            self.isOn = false
        
            layer.shadowColor = color
            layer.shadowRadius = 2.5
            layer.shadowOpacity = 0.3
            layer.shadowOffset = CGSize(width: 1.0, height: 2)
    }
}
