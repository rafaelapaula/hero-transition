//
//  File.swift
//  HeroTransitions
//
//  Created by Rafaela Lourenço de Paula on 19/10/2018.
//  Copyright © 2018 Rafaela Lourenço de Paula. All rights reserved.
//

import UIKit

class HTGenericViewController: UIViewController {
    
    private var heightTabBar = CGFloat(-50.0)
    private var heightNavBarTitle = CGFloat(20.0)
    private var heightNavBar = CGFloat(0.0)
    
    private var navigationView = UIImageView()
    
    func setCustomNavigationBar(hasTitle: Bool = true, secondTitleWithDifferentColor: String? = "", isHeroEnabled: Bool) {
        
        if self.clearNavigationBar() {
            
            defineHeightNavBar(hasTitle: hasTitle)
            
            setNavView(pointY: heightNavBarTitle + heightNavBar, isHeroEnable: isHeroEnabled)
            setMarginInFirstChildView(hasTitle: hasTitle)
            
            if hasTitle {
                
                setLargeTitle()
                
                if let secTitle = secondTitleWithDifferentColor {
                    setSecondLargeTitle(secondTitle: secTitle)
                }
                
            }
            
            
        }
    }
    
    fileprivate func setLargeTitle() {
        
        let labelTitle = UILabel(frame: CGRect(x: (self.view.frame.width / 16.0 ), y: (heightNavBar * 0.5), width: self.view.frame.width, height: heightNavBarTitle))
        labelTitle.font = UIFont.systemFont(ofSize: 30)
        labelTitle.textColor = UIColor.blue
        labelTitle.text = self.title
        labelTitle.textAlignment = .center
        self.title = ""
        
        self.view.addSubview(labelTitle)
    }
    
    fileprivate func setSecondLargeTitle(secondTitle: String) {
        
        let labelTitle = UILabel(frame: CGRect(
            x: (self.view.frame.width / 10.0 ),
            y: heightNavBar,
            width: self.view.frame.width,
            height: heightNavBarTitle))
        labelTitle.font = UIFont.systemFont(ofSize: 30)
        labelTitle.textColor = UIColor.red
        labelTitle.text = secondTitle
        labelTitle.textAlignment = .center
        
        self.view.addSubview(labelTitle)
    }
    
    fileprivate func setMarginInFirstChildView(hasTitle: Bool) {
        
        if let firstView = self.view.subviews.first {
            if let constraint = firstView.findConstraint(layoutAttribute: .top) {
                let lastConstant = constraint.constant
                constraint.constant = lastConstant + (hasTitle ? self.heightNavBarTitle * 1.2 : self.heightNavBarTitle * 0.8)
                
            }
        }
    }
    
    fileprivate func setMarginInLastChildView() {
        
        if let lastView = self.view.subviews.last {
            if let constraint = lastView.findConstraint(layoutAttribute: .bottom) {
                let lastConstant = constraint.constant
                constraint.constant = lastConstant + self.heightTabBar
            }
        }
    }
    
    fileprivate func setNavView(pointY: CGFloat, isHeroEnable: Bool = false) {
        
        navigationView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: pointY * 1.1))
        navigationView.image = UIImage(named: "2-LESSONS_Bckg-0")
        if isHeroEnable {
            navigationView.hero.id = "redView"
        }
        
        
        navigationView.backgroundColor = .clear
        view.addSubview(navigationView)
    }
    
    /*
     MARK: NavigationBar Configurations
     */
    
    func clearNavigationBar() -> Bool {
        if let navBar = self.navigationController?.navigationBar {
            navBar.setBackgroundImage(UIImage(), for: .default)
            navBar.shadowImage = UIImage()
            navBar.isTranslucent = true
            navBar.topItem?.title = ""
            
            self.heightNavBarTitle = self.heightNavBarTitle + navBar.frame.size.height
            
            return true
        }
        
        return false
    }
    
    fileprivate func defineHeightNavBar(hasTitle: Bool) {
        if let navBar = self.navigationController?.navigationBar {
            if hasTitle {
                self.heightNavBar = navBar.frame.size.height * 2
            } else {
                self.heightNavBar = navBar.frame.size.height / 2
            }
        }
        
    }
}

extension UIView {
    
    func findConstraint(layoutAttribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: layoutAttribute) {
                return constraint
            }
        }
        return nil
    }
    
    func itemMatch(constraint: NSLayoutConstraint, layoutAttribute: NSLayoutConstraint.Attribute) -> Bool {
        if let firstItem = constraint.firstItem as? UIView, let secondItem = constraint.secondItem as? UIView {
            let firstItemMatch = firstItem == self && constraint.firstAttribute == layoutAttribute
            let secondItemMatch = secondItem == self && constraint.secondAttribute == layoutAttribute
            return firstItemMatch || secondItemMatch
        }
        return false
    }
    
}
