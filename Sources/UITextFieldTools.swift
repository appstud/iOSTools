//
//  UITextFieldTools.swift
//  iOSTools
//
//  Created by Vladas Zakrevskis on 10/12/17.
//  Copyright © 2017 VladasZ. All rights reserved.
//

import UIKit

public extension UITextField {
    
    //Thanks to Nik Kov:
    //https://stackoverflow.com/questions/1340224/iphone-uitextfield-change-placeholder-text-color
    @IBInspectable var placeholderColor: UIColor {
        get {
            guard let currentAttributedPlaceholderColor = attributedPlaceholder?.attribute(NSAttributedStringKey.foregroundColor, at: 0, effectiveRange: nil) as? UIColor else { return UIColor.clear }
            return currentAttributedPlaceholderColor
        }
        set {
            guard let currentAttributedString = attributedPlaceholder else { return }
            let attributes = [NSAttributedStringKey.foregroundColor : newValue]
            
            attributedPlaceholder = NSAttributedString(string: currentAttributedString.string, attributes: attributes)
        }
    }
}
