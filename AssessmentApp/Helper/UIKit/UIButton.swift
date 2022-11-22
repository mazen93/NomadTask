//
//  UIButton.swift
//  AssessmentApp
//
//  Created by host on 22/11/2022.
//

import Foundation
import UIKit
@IBDesignable extension UIButton {

    @IBInspectable  var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable  var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable  var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
    
    
    
    
        func setImage(url: String? = "") {
            if let urlString = url, let url = URL(string: urlString) {
                sd_imageIndicator?.startAnimatingIndicator()
                sd_setBackgroundImage(with: url, for: .normal, completed: .none)
            } else {
                setBackgroundImage(UIImage(named: "placeholder"), for: .normal)
            }
        }
  
}



