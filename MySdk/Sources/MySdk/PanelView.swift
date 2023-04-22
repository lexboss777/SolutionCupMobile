//
//  File.swift
//  
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import Foundation
import UIKit

public class PanelView : TraitView {
    
    // MARK: - properties
    
    private var hasShadow = true
    
    public var xMargin: CGFloat = 20
    public var yMargin: CGFloat = 16
    public var subheaderTopMargin: CGFloat = 8
    public var subheaderBottomMargin: CGFloat = 18
    
    public let headerLabel = UILabel()
    public let subheaderLabel = UILabel()
    public let imv = UIImageView()
    public let button = UIButton(type: .system)
    public let closeBtn = UIButton(type: .system)
    
    public var isImageOnLeft = false

    // MARK: - init
    
    init(shadow: Bool) {
        hasShadow = shadow
        super.init(frame: CGRect.zero)
        setupView()
    }

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
        
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.textColor = UIColor(0x333333);
        addSubview(headerLabel)
        
        subheaderLabel.font = UIFont.systemFont(ofSize: 15)
        subheaderLabel.textColor = UIColor(0x9299A2);
        addSubview(subheaderLabel)
        
        addSubview(imv)
        
        button.backgroundColor = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
        button.layer.cornerRadius = 12
        addSubview(button)
        
        addSubview(closeBtn)
        
        layer.cornerRadius = 20
        
        if hasShadow {
            setupShadow()
        }
    }
    
    // MARK: - overridden base members

    public override func sizeToFit() {

        let width = frame.width

        var y: CGFloat = 0
        
        if imv.image != nil {
            imv.sizeToFit()
            imv.move(width - imv.frame.width - 16, yMargin)
        }
        
        headerLabel.sizeToFit()
        headerLabel.move(xMargin, yMargin)
        y = headerLabel.frame.maxY
        
        subheaderLabel.isHidden = subheaderLabel.text == nil
        if !subheaderLabel.isHidden {
            y += subheaderTopMargin
            subheaderLabel.sizeToFit()
            subheaderLabel.move(xMargin, y)
            y += subheaderLabel.frame.height
            y += subheaderBottomMargin
        } else {
            y = imv.frame.maxY + yMargin
        }
        
        if button.title(for: .normal) != nil {
            button.setTop(y)
            button.setHeight(44)
            button.setWidth(frame.width - 2 * xMargin)
            button.setLeft(xMargin)
            y = button.frame.maxY + 20
        }
        
        if isImageOnLeft {
            imv.setLeft(xMargin)
            headerLabel.setLeft(imv.frame.maxX + xMargin)
            subheaderLabel.setLeft(imv.frame.maxX + xMargin)
        }
        
        if closeBtn.imageView?.image != nil {
            closeBtn.sizeToFit()
            closeBtn.move(frame.width - closeBtn.frame.width - 16, 16)
        }
        
        self.setHeight(y)
    }
}
