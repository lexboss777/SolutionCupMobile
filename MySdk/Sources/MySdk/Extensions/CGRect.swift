//
//  File.swift
//
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import Foundation
import UIKit

public extension CGRect {
    init(x: CGFloat, y: CGFloat, size: CGSize) {
        self.init(x: x, y: y, width: size.width, height: size.height)
    }

    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
}
