//
//  File.swift
//  
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import Foundation
import UIKit

/// Factory for creating PanelViews
public class PanelFactory {
    
    /// Creates a panel with title and an image
    public class func panel(title: String, image: UIImage?) -> PanelView {
        let panel = PanelView()
        panel.headerLabel.text = title
        panel.imv.image = image
        return panel
    }
    
    /// Creates a panel with title, subtitle and an image
    public class func panel(title: String, subtitle: String, image: UIImage?) -> PanelView {
        let panel = PanelView()
        panel.headerLabel.text = title
        panel.subheaderLabel.text = subtitle
        panel.imv.image = image
        return panel
    }
    
    /// Creates a panel with title, subtitle and an left-aligned image. Also can specify if to create shadow
    public class func leftImagePanel(_ title: String, _ subtitle: String, _ image: UIImage?, _ shadow: Bool) -> PanelView {
        let panel = PanelView(shadow: shadow)
        panel.headerLabel.text = title
        panel.subheaderLabel.text = subtitle
        panel.imv.image = image
        panel.isImageOnLeft = true
        panel.yMargin = 20
        panel.subheaderTopMargin = 4
        panel.subheaderBottomMargin = 20
        panel.headerLabel.font = UIFont.systemFont(ofSize: 17)
        panel.subheaderLabel.font = UIFont.systemFont(ofSize: 13)
        return panel
    }
}
