//
//  File.swift
//  
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import Foundation
import UIKit

public class TraitView : UIView {
    
    public var autoDark = true
    
    public func setupShadow() {
        if traitCollection.userInterfaceStyle == .dark && autoDark {
            backgroundColor = UIColor(0xF6F7F8)
            layer.shadowOpacity = 0
        } else {
            backgroundColor = .white
            
            layer.cornerRadius = 20.0
            layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
            layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
            layer.shadowRadius = 34.0
            layer.shadowOpacity = 1
        }
    }
    
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if !autoDark {
            return
        }
        
        if #available(iOS 12.0, *) {
            setupShadow()
        } else {
            
        }
    }
}
