//
//  ViewController.swift
//  SolutionCup
//
//  Created by Ilnur Shafigullin on 22.04.2023.
//

import UIKit
import MySdk

class ViewController: UIViewController {

    let themeBtn = UIButton(type: .system)
    
    var panel: PanelView!
    var panelHeaderOnly: PanelView!
    var panelButton: PanelView!
    var leftImagePanel: PanelView!
    var leftImagePanelClose: PanelView!
    
    let cardView = CardView()
    let cardViewNoBtn = CardView()
    
    let rollViewBtn = RollView()
    let rollView = RollView()
    
    let btn = ButtonFactory.getButton("Button")
    let btnhighlighted = ButtonFactory.getButtonHighlighted("Button highlighted")
    
    var views: [UIView] = []
    
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        themeBtn.setTitleColor(.black, for: .normal)
        themeBtn.setTitle("Toggle theme", for: .normal)
        themeBtn.addAction {
            if self.traitCollection.userInterfaceStyle == .dark {
                self.overrideUserInterfaceStyle = .light
            } else {
                self.overrideUserInterfaceStyle = .dark
            }
        }
        themeBtn.backgroundColor = .lightGray
        themeBtn.layer.cornerRadius = 12
        view.addSubview(themeBtn)
        
        let image = UIImage(named: "star")
        
        panel = PanelFactory.panel(title: "Header", subtitle: "Subheader", image: image)
        
        panelHeaderOnly = PanelFactory.panel(title: "Header", image: image)
        
        panelButton = PanelFactory.panel(title: "Header", subtitle: "Subheader", image: image)
        panelButton.button.setTitle("Button", for: .normal)
        
        leftImagePanel = PanelFactory.leftImagePanel("Title", "Description", image, true)
        
        leftImagePanelClose = PanelFactory.leftImagePanel("Title", "Description", image, true)
        leftImagePanelClose.closeBtn.setImage(UIImage(named: "close")?.withRenderingMode(.alwaysOriginal), for: .normal)
        leftImagePanelClose.autoDark = false
        
        for _ in 0..<5 {
            cardView.addItem("Title", "Description", image)
        }
        cardView.headerLabel.text = "Header"
        cardView.rightButton.setTitle("Button", for: .normal)
        cardView.button.setTitle("Button", for: .normal)
        
        for _ in 0..<5 {
            cardViewNoBtn.addItem("Title", "Description", image)
        }
        cardViewNoBtn.headerLabel.text = "Header"
        cardViewNoBtn.rightButton.setTitle("Button", for: .normal)
        
        for _ in 0..<3 {
            rollViewBtn.addItem("Title", "Subtitle", image)
        }
        rollViewBtn.headerLabel.text = "Header"
        rollViewBtn.rightButton.setTitle("Button", for: .normal)
        rollViewBtn.button.setTitle("Button", for: .normal)
        
        for _ in 0..<3 {
            rollView.addItem("Title", "Subtitle", image)
        }
        rollView.headerLabel.text = "Header"
        rollView.rightButton.setTitle("Button", for: .normal)
        
        views.append(panel)
        views.append(panelHeaderOnly)
        views.append(panelButton)
        views.append(leftImagePanel)
        views.append(leftImagePanelClose)
        views.append(cardView)
        views.append(cardViewNoBtn)
        views.append(rollViewBtn)
        views.append(rollView)
        views.append(btn)
        views.append(btnhighlighted)
        
        for v in views {
            scrollView.addSubview(v)
        }
        
        scrollView.backgroundColor = .clear
        
        view.addSubview(scrollView)
    }
    
    override func viewDidLayoutSubviews() {

        let h = view.frame.height
    
        var y: CGFloat = 80
        let marginX: CGFloat = 25
        let marginY: CGFloat = 22
        
        themeBtn.sizeToFit()
        themeBtn.setWidth(themeBtn.frame.width + 40)
        themeBtn.move(marginX, 60)
        
        scrollView.frame = CGRect(0, y + 20, view.frame.width, h - y)
        scrollView.contentInset = UIEdgeInsets(top: 20, left: marginX, bottom: 20, right: marginX);

        y = 0
        
        for v in views {
            
            v.setWidth(view.frame.width - 2 * marginX)
            v.move(0, y)
            v.sizeToFit()
            y = v.frame.maxY + marginY
        }
        
        scrollView.contentSize = CGSize(scrollView.frame.width - 2 * marginX, y + marginY)
    }
}

