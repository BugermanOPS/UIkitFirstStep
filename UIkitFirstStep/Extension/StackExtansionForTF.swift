//
//  StackExtansionForTF.swift
//  UIkitFirstStep
//
//  Created by andrei on 02.12.2023.
//

import UIKit

extension UIStackView{
    
    convenience init(views: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat,
                     aligment: Alignment) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
        self.alignment = aligment
     //   self.frame.size.height = 100

        
    }
}
