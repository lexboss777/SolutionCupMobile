//
//  File.swift
//  
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import Foundation
import UIKit

/// View that represents group of items
public class CardView : TraitView {
    
    // MARK: - properties
    
    public var marginX: CGFloat = 20
    public var marginY: CGFloat = 15
    
    public let headerLabel = UILabel()
    public let rightButton = UIButton(type: .system)
    public let button = UIButton(type: .system)
    
    var views: [PanelView] = []
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    /// common setup method for a view
    private func setupView() {
        setupShadow()
        
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.textColor = UIColor(0x333333);
        addSubview(headerLabel)
        
        addSubview(rightButton)
        
        button.backgroundColor = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
        button.layer.cornerRadius = 12
        addSubview(button)
        
        layer.cornerRadius = 20
    }
    
    // MARK: - overridden base members

    public override func sizeToFit() {

        var y: CGFloat = 16
        
        headerLabel.sizeToFit()
        headerLabel.move(20, y)
        y = headerLabel.frame.maxY
        
        rightButton.sizeToFit()
        rightButton.move(frame.width - rightButton.frame.width - 20, 18)
        
        for v in views {
            
            v.setWidth(frame.width)
            v.move(0, y)
            v.sizeToFit()
            y = v.frame.maxY
        }
        
        if button.title(for: .normal) != nil {
            button.setTop(y + 20)
            button.setHeight(44)
            button.setWidth(frame.width - 2 * marginX)
            button.setLeft(marginX)
            y = button.frame.maxY
        }
        
        self.setHeight(y + 20)
    }
    
    // MARK: - public methods
    
    /// adds new item to a vertical group
    public func addItem(_ title: String, _ subtitle: String, _ image: UIImage?) {
        let panelView = PanelFactory.leftImagePanel(title, subtitle, image, false)
        panelView.subheaderBottomMargin = 0
        panelView.autoDark = false
        panelView.layer.cornerRadius = 0
        addSubview(panelView)
        views.append(panelView)
    }
}
