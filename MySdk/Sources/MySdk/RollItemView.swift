//
//  File.swift
//  
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import Foundation
import UIKit

/// View that is used in RollView
public class RollItemView : UIView {
    
    // MARK: - properties
    
    public var xMargin: CGFloat = 12
    
    public let headerLabel = UILabel()
    public let subheaderLabel = UILabel()
    public let imv = UIImageView()

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
        
        backgroundColor = UIColor(red: 0, green: 0.063, blue: 0.141, alpha: 0.03)
        
        headerLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        headerLabel.textColor = UIColor(0x333333);
        addSubview(headerLabel)
        
        subheaderLabel.font = UIFont.systemFont(ofSize: 13)
        subheaderLabel.textColor = UIColor(0x9299A2);
        addSubview(subheaderLabel)
        
        addSubview(imv)
        
        layer.cornerRadius = 20
    }
    
    // MARK: - overridden base members

    public override func sizeToFit() {

        var y: CGFloat = frame.height
        
        if imv.image != nil {
            imv.sizeToFit()
            imv.move(12, 12)
        }
        
        subheaderLabel.isHidden = subheaderLabel.text == nil
        if !subheaderLabel.isHidden {
            subheaderLabel.sizeToFit()
            subheaderLabel.move(12, y - 12 - subheaderLabel.frame.height)
            y = subheaderLabel.frame.minY
        }
        
        headerLabel.sizeToFit()
        headerLabel.move(xMargin, y - headerLabel.frame.height - 4)
    }
}
