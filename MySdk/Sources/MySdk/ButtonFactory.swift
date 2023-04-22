//
//  File.swift
//  
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import Foundation
import UIKit

/// Factory for creating Buttons
public class ButtonFactory {
    
    /// Just a simple button
    public class func getButton(_ title: String) -> UIButton {
        let button = MyBtn(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
        button.layer.cornerRadius = 12
        
        return button
    }
    
    /// Simple button with highlighted style
    public class func getButtonHighlighted(_ title: String) -> UIButton {
        let button = MyBtn(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.06)
        button.layer.cornerRadius = 12
        
        return button
    }
}
