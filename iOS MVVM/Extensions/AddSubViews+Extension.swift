//
//  AddSubViews+Extension.swift
//  iOS MVVM
//
//  Created by Kerem Demir on 30.07.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubViews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
