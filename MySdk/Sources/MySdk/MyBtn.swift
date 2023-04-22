//
//  File.swift
//  
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import Foundation
import UIKit

/// UIButton with constant height
public class MyBtn : UIButton {
    override public func sizeToFit() {
        self.setHeight(44)
    }
}
