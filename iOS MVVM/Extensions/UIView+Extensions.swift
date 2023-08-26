//
//  UIView+Extensions.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 26.08.2023.
//

import Foundation
import UIKit

extension UIView {
    
    func round(_ radius: CGFloat ) {
        self.layer.cornerRadius = radius
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
