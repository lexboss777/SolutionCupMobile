//
//  File.swift
//  
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import Foundation
import UIKit

/// View that allows to group items with horizontal scroll.
public class RollView : TraitView {
    
    // MARK: - properties
    
    private var views: [RollItemView] = []
    private var scrollView = UIScrollView()
    
    public var marginX: CGFloat = 20
    public var marginY: CGFloat = 15
    
    public let headerLabel = UILabel()
    public let rightButton = UIButton(type: .system)
    public let button = UIButton(type: .system)
    
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
        autoDark = false
        setupShadow()
        
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.textColor = UIColor(0x333333);
        addSubview(headerLabel)
        
        addSubview(rightButton)
        
        button.backgroundColor = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
        button.layer.cornerRadius = 12
        addSubview(button)
        
        scrollView.showsHorizontalScrollIndicator = false
        addSubview(scrollView)
        
        layer.cornerRadius = 20
    }
    
    // MARK: - overridden base members

    public override func sizeToFit() {

        var y: CGFloat = 16
        
        headerLabel.sizeToFit()
        headerLabel.move(marginX, y)
        y = headerLabel.frame.maxY + 12
        
        rightButton.sizeToFit()
        rightButton.move(frame.width - rightButton.frame.width - 20, 18)
        
        var x: CGFloat = 0
        var contentSizeX: CGFloat = 0
        
        for v in views {
            
            v.setWidth(140)
            v.setHeight(140)
            v.sizeToFit()
            v.move(x, 0)
            x = v.frame.maxX + 12
            contentSizeX += v.frame.width + 12
        }
        
        scrollView.setLeft(0)
        scrollView.setTop(y)
        scrollView.setHeight(140)
        scrollView.setWidth(frame.width)
        scrollView.contentInset = UIEdgeInsets(top: 0, left: marginX, bottom: 0, right: 0);
        scrollView.contentSize = CGSize(contentSizeX, scrollView.frame.height)
        y += scrollView.frame.height
        
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
    
    /// adds new item to a horizontally scrolled group
    public func addItem(_ title: String, _ subtitle: String, _ image: UIImage?) {
        let roll = RollItemView()
        roll.headerLabel.text = title
        roll.subheaderLabel.text = subtitle
        roll.imv.image = UIImage(named: "star")
        addSubview(roll)
        scrollView.addSubview(roll)
        views.append(roll)
    }
}
