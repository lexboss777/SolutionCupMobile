//
//  File.swift
//  
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import UIKit

public extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping() -> Void) {
        if #available(iOS 14.0, *) {
            addAction(UIAction { (_: UIAction) in closure() }, for: controlEvents)
        } else {
            // Fallback on earlier versions
        }
    }
}

