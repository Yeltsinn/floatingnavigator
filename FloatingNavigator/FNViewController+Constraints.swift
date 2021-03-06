//
//  FNViewController+Constraints.swift
//  FloatingNavigator
//
//  Created by Yeltsin Suares Lobato Gama on 10/7/16.
//  Copyright © 2016 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

extension FNViewController {
    
    /* MARK: ScrollView Constraints */
    
    internal func setupScrollViewConstraints() {
        
        let scrollViewDistanceToTop = NSLayoutConstraint(item: scrollView,
                                                         attribute: NSLayoutAttribute.top,
                                                         relatedBy: NSLayoutRelation.equal,
                                                         toItem: tabViews.first,
                                                         attribute: NSLayoutAttribute.bottom,
                                                         multiplier: 1,
                                                         constant: 0)
        
        let scrollViewDistanceToBottom = NSLayoutConstraint(item: scrollView,
                                                            attribute: NSLayoutAttribute.bottom,
                                                            relatedBy: NSLayoutRelation.equal,
                                                            toItem: self.view,
                                                            attribute: NSLayoutAttribute.bottom,
                                                            multiplier: 1,
                                                            constant: 0)
        
        let scrollViewDistanceToMarginLeft = NSLayoutConstraint(item: scrollView,
                                                                attribute: NSLayoutAttribute.left,
                                                                relatedBy: NSLayoutRelation.equal,
                                                                toItem: self.mainView,
                                                                attribute: NSLayoutAttribute.left,
                                                                multiplier: 1,
                                                                constant: 0)
        
        let scrollViewDistanceToMarginRight = NSLayoutConstraint(item: scrollView,
                                                                 attribute: NSLayoutAttribute.right,
                                                                 relatedBy: NSLayoutRelation.equal,
                                                                 toItem: self.mainView,
                                                                 attribute: NSLayoutAttribute.right,
                                                                 multiplier: 1,
                                                                 constant: 0)
        
        self.constraintsToActivate.append(contentsOf: [
            scrollViewDistanceToTop,
            scrollViewDistanceToBottom,
            scrollViewDistanceToMarginLeft,
            scrollViewDistanceToMarginRight
            ])
    }
    
    /* MARK: TabViews Constraints */
    
    internal func setHeightConstraintsOfTabViews() {
        
        let constraintHeightFirstTabView = NSLayoutConstraint(item: tabViews.first!,
                                                              attribute: NSLayoutAttribute.height,
                                                              relatedBy: NSLayoutRelation.equal,
                                                              toItem: nil,
                                                              attribute: NSLayoutAttribute.height,
                                                              multiplier: 1,
                                                              constant: tabViewsHeigth)
        
        constraintHeightFirstTabView.priority = 400
        
        self.constraintsToActivate.append(constraintHeightFirstTabView)
        
        for tabView in tabViews {
            
            if tabView != tabViews.first {
                let constraintHeightTabView = NSLayoutConstraint(item: tabView,
                                                                 attribute: NSLayoutAttribute.height,
                                                                 relatedBy: NSLayoutRelation.equal,
                                                                 toItem: tabViews.first,
                                                                 attribute: NSLayoutAttribute.height,
                                                                 multiplier: 1,
                                                                 constant: 0)
                self.constraintsToActivate.append(constraintHeightTabView)
            }
        }
    }
    
    internal func setWidthConstraintsOfTabViews() {
        
        for tabView in tabViews {
            if tabView != tabViews.first {
                let constraintWidthTabView = NSLayoutConstraint(item: tabView,
                                                                attribute: NSLayoutAttribute.width,
                                                                relatedBy: NSLayoutRelation.equal,
                                                                toItem: tabViews.first,
                                                                attribute: NSLayoutAttribute.width,
                                                                multiplier: 1,
                                                                constant: 0)
                self.constraintsToActivate.append(constraintWidthTabView)
            }
        }
    }
    
    internal func setCenterYConstraintOfTabViews() {
        
        for tabView in tabViews {
            if tabView != tabViews.first   {
                let constraintCenterYTabView = NSLayoutConstraint(item: tabView,
                                                                  attribute: NSLayoutAttribute.centerY,
                                                                  relatedBy: NSLayoutRelation.equal,
                                                                  toItem: tabViews.first,
                                                                  attribute: NSLayoutAttribute.centerY,
                                                                  multiplier: 1,
                                                                  constant: 0)
                self.constraintsToActivate.append(constraintCenterYTabView)
            }
        }
    }
    
    internal func setConstraintsToFirstAndLastTabViews() {
        
        let constrainsDistanceFirstTabViewToTop = NSLayoutConstraint(item: tabViews.first!,
                                                                     attribute: NSLayoutAttribute.top,
                                                                     relatedBy: NSLayoutRelation.equal,
                                                                     toItem: self.mainView,
                                                                     attribute: NSLayoutAttribute.top,
                                                                     multiplier: 1,
                                                                     constant: headerView.frame.height)
        
        let constraintDistanceFirstTabViewToMarginLeft = NSLayoutConstraint(item: tabViews.first!,
                                                                            attribute: NSLayoutAttribute.left,
                                                                            relatedBy: NSLayoutRelation.equal,
                                                                            toItem: self.mainView,
                                                                            attribute: NSLayoutAttribute.left,
                                                                            multiplier: 1,
                                                                            constant: 0)
        
        let constraintDistanceLastViewToMarginRight = NSLayoutConstraint(item: tabViews.last!,
                                                                         attribute: NSLayoutAttribute.right,
                                                                         relatedBy: NSLayoutRelation.equal,
                                                                         toItem: self.mainView,
                                                                         attribute: NSLayoutAttribute.right,
                                                                         multiplier: 1,
                                                                         constant: 0)
        self.constraintsToActivate.append(contentsOf: [
            constrainsDistanceFirstTabViewToTop,
            constraintDistanceLastViewToMarginRight,
            constraintDistanceFirstTabViewToMarginLeft
            ])
    }
    
    internal func setConstraintDistanceBetweenTabViews() {
        
        var previousView = tabViews.first
        for currentTabView in tabViews {
            if currentTabView != tabViews.first && currentTabView != tabViews.last  {
                let constraintDistanceOfPreviousTabView = NSLayoutConstraint(item: currentTabView,
                                                                             attribute: NSLayoutAttribute.left,
                                                                             relatedBy: NSLayoutRelation.equal,
                                                                             toItem: previousView,
                                                                             attribute: NSLayoutAttribute.right,
                                                                             multiplier: 1,
                                                                             constant: 0)
                self.constraintsToActivate.append(constraintDistanceOfPreviousTabView)
                previousView = currentTabView
            }
        }
        if numberOfTabs > 1 {
            let constraintDistancePenultimateTabViewToLastTabView = NSLayoutConstraint(item: tabViews[tabViews.count - 2],
                                                                                       attribute: NSLayoutAttribute.right,
                                                                                       relatedBy: NSLayoutRelation.equal,
                                                                                       toItem: tabViews.last,
                                                                                       attribute: NSLayoutAttribute.left,
                                                                                       multiplier: 1, constant: 0)
            constraintsToActivate.append(constraintDistancePenultimateTabViewToLastTabView)
        }
        
        
    }
    
    /* MARK: Controllers Constraints */
    
    internal func setupViewControllersConstraints() {
        scrollView.addSubview(tabViewsControllers.first!.view)
        tabViewsControllers.first!.view.translatesAutoresizingMaskIntoConstraints = false
        
        let distanceFirstViewControllerToTop = NSLayoutConstraint(item: tabViewsControllers.first!.view,
                                                                  attribute: NSLayoutAttribute.top,
                                                                  relatedBy: NSLayoutRelation.equal,
                                                                  toItem: tabViews.first,
                                                                  attribute: NSLayoutAttribute.bottom,
                                                                  multiplier: 1,
                                                                  constant: 0)
        
        let distanceFirstViewControllerToBottom = NSLayoutConstraint(item: tabViewsControllers.first!.view,
                                                                     attribute: NSLayoutAttribute.bottom,
                                                                     relatedBy: NSLayoutRelation.equal,
                                                                     toItem: self.mainView,
                                                                     attribute: NSLayoutAttribute.bottom,
                                                                     multiplier: 1,
                                                                     constant: 0)
        
        let distanceFirstViewControllerToMarginLeft = NSLayoutConstraint(item: tabViewsControllers.first!.view,
                                                                         
                                                                         attribute: NSLayoutAttribute.left,
                                                                         relatedBy: NSLayoutRelation.equal,
                                                                         toItem: self.scrollView,
                                                                         attribute: NSLayoutAttribute.left,
                                                                         multiplier: 1,
                                                                         constant: 0)
        
        let sizeWidthFirstViewController = NSLayoutConstraint(item: tabViewsControllers.first!.view,
                                                              attribute: NSLayoutAttribute.width,
                                                              relatedBy: NSLayoutRelation.equal,
                                                              toItem: self.mainView,
                                                              attribute: NSLayoutAttribute.width,
                                                              multiplier: 1,
                                                              constant: 0)
        
        self.constraintsToActivate.append(contentsOf: [distanceFirstViewControllerToTop,
                                                       distanceFirstViewControllerToBottom,
                                                       distanceFirstViewControllerToMarginLeft,
                                                       sizeWidthFirstViewController])
        
        var previousView = tabViewsControllers[0].view
        for (index, view) in tabViewsControllers.enumerated() {
            if index != 0 {
                scrollView.addSubview(view.view)
                view.view.translatesAutoresizingMaskIntoConstraints = false
                let constraintHeightOfCurrentView = NSLayoutConstraint(item: view.view,
                                                                       attribute: NSLayoutAttribute.height,
                                                                       relatedBy: NSLayoutRelation.equal,
                                                                       toItem: previousView,
                                                                       attribute: NSLayoutAttribute.height,
                                                                       multiplier: 1,
                                                                       constant: 0)
                
                let constraintDistanceLastViewToMarginRight = NSLayoutConstraint(item: view.view,
                                                                                 attribute: NSLayoutAttribute.width,
                                                                                 relatedBy: NSLayoutRelation.equal,
                                                                                 toItem: self.mainView,
                                                                                 attribute: NSLayoutAttribute.width,
                                                                                 multiplier: 1,
                                                                                 constant: 0)
                
                let constraintDistanceToMarginLeft = NSLayoutConstraint(item: view.view,
                                                                        attribute: NSLayoutAttribute.left,
                                                                        relatedBy: NSLayoutRelation.equal,
                                                                        toItem: previousView,
                                                                        attribute: NSLayoutAttribute.right,
                                                                        multiplier: 1,
                                                                        constant: 0)
                
                let distanceFirstViewControllerToTop = NSLayoutConstraint(item: view.view,
                                                                          attribute: NSLayoutAttribute.top,
                                                                          relatedBy: NSLayoutRelation.equal,
                                                                          toItem: tabViews.first,
                                                                          attribute: NSLayoutAttribute.bottom,
                                                                          multiplier: 1,
                                                                          constant: 0)
                
                self.constraintsToActivate.append(contentsOf: [
                    constraintHeightOfCurrentView,
                    constraintDistanceLastViewToMarginRight,
                    constraintDistanceToMarginLeft,
                    distanceFirstViewControllerToTop
                    ])
                previousView = view.view
            }
        }
    }
    
    /* MARK: Tab Indicator Constraints --- */
    
    internal func setupTabIndicatorConstraints() {
        
        /* Setup TabView Base */
        let tabViewBase =  UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tabViewBase.backgroundColor = UIColor(colorLiteralRed: 225.0/255,
                                              green: 228.0/255,
                                              blue: 229.0/255,
                                              alpha: 1.0)
        tabViewBase.translatesAutoresizingMaskIntoConstraints = false
        self.mainView.addSubview(tabViewBase)
        
        let tabViewBottomSeparatorDistanceToBottom = NSLayoutConstraint(item: tabViewBase,
                                                                        attribute: NSLayoutAttribute.bottom,
                                                                        relatedBy: NSLayoutRelation.equal,
                                                                        toItem: tabViews.first,
                                                                        attribute: NSLayoutAttribute.bottom,
                                                                        multiplier: 1,
                                                                        constant: 0)
        
        let tabViewBottomSeparatorDistanceToMarginLeft = NSLayoutConstraint(item: tabViewBase,
                                                                            attribute: NSLayoutAttribute.left,
                                                                            relatedBy: NSLayoutRelation.equal,
                                                                            toItem: self.mainView,
                                                                            attribute: NSLayoutAttribute.left,
                                                                            multiplier: 1,
                                                                            constant: 0)
        
        let tabViewBottomSeparatorDistanceToMarginRight = NSLayoutConstraint(item: tabViewBase,
                                                                             attribute: NSLayoutAttribute.right,
                                                                             relatedBy: NSLayoutRelation.equal,
                                                                             toItem: self.mainView,
                                                                             attribute: NSLayoutAttribute.right,
                                                                             multiplier: 1,
                                                                             constant: 0)
        
        let constraintHeightTabViewSeparator = NSLayoutConstraint(item: tabViewBase,
                                                                  attribute: NSLayoutAttribute.height,
                                                                  relatedBy: NSLayoutRelation.equal,
                                                                  toItem: nil,
                                                                  attribute: NSLayoutAttribute.height,
                                                                  multiplier: 1,
                                                                  constant: 1)

        self.constraintsToActivate.append(contentsOf: [
            constraintHeightTabViewSeparator,
            tabViewBottomSeparatorDistanceToMarginRight,
            tabViewBottomSeparatorDistanceToMarginLeft,
            tabViewBottomSeparatorDistanceToBottom])
        
        /* Setup TabView Indicator */
        tabViewIndicator = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        tabViewIndicator.backgroundColor = colorOfTabViewIndicator
        tabViewIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.mainView.addSubview(tabViewIndicator)
        
        let constrainsDistanceToTopTabIndicator = NSLayoutConstraint(item: tabViewIndicator,
                                                                     attribute: NSLayoutAttribute.bottom,
                                                                     relatedBy: NSLayoutRelation.equal,
                                                                     toItem: tabViews.first,
                                                                     attribute: NSLayoutAttribute.bottom,
                                                                     multiplier: 1,
                                                                     constant: 0)
        
        distanceTabIndicatorToMarginLeftConstraint = NSLayoutConstraint(item: tabViewIndicator,
                                                                        attribute: NSLayoutAttribute.left,
                                                                        relatedBy: NSLayoutRelation.equal,
                                                                        toItem: tabViews.first,
                                                                        attribute: NSLayoutAttribute.left,
                                                                        multiplier: 1,
                                                                        constant: 0)
        
        let constraintWidthTabIndicator = NSLayoutConstraint(item: tabViewIndicator,
                                                             attribute: NSLayoutAttribute.width,
                                                             relatedBy: NSLayoutRelation.equal,
                                                             toItem: tabViews.first,
                                                             attribute: NSLayoutAttribute.width,
                                                             multiplier: 1,
                                                             constant: 0)
        
        let constraintHeightTabIndicator: NSLayoutConstraint!
        if tabViewIndicatorStyle == .simple {
            
            constraintHeightTabIndicator = NSLayoutConstraint(item: tabViewIndicator,
                                                                  attribute: NSLayoutAttribute.height,
                                                                  relatedBy: NSLayoutRelation.equal,
                                                                  toItem: nil,
                                                                  attribute: NSLayoutAttribute.height,
                                                                  multiplier: 1,
                                                                  constant: tabViewIndicatorHeigth)
            
        } else {
            
            tabViewIndicator.layer.zPosition = -1
            constraintHeightTabIndicator = NSLayoutConstraint(item: tabViewBase,
                                                                  attribute: NSLayoutAttribute.top,
                                                                  relatedBy: NSLayoutRelation.equal,
                                                                  toItem: tabViews.first,
                                                                  attribute: NSLayoutAttribute.top,
                                                                  multiplier: 1,
                                                                  constant: 1)
        }
        
        

        
        distanceTabViewComponentsToSideBounds += tabViewIndicatorHeigth
        
        self.constraintsToActivate.append(contentsOf: [
            distanceTabIndicatorToMarginLeftConstraint,
            constrainsDistanceToTopTabIndicator,
            constraintHeightTabIndicator,
            constraintHeightTabIndicator,
            constraintWidthTabIndicator])
    }
    
    /* MARK: Tab Header View Constraints */
    
    func setupHeaderViewConstraints() {
        
        self.mainView.addSubview(headerView)
        
        let distanceLeading = NSLayoutConstraint(item: headerView,
                                                 attribute: NSLayoutAttribute.right,
                                                 relatedBy: NSLayoutRelation.equal,
                                                 toItem: self.mainView,
                                                 attribute: NSLayoutAttribute.right,
                                                 multiplier: 1,
                                                 constant: 0)
        
        let distanceTrailing = NSLayoutConstraint(item: headerView,
                                                  attribute: NSLayoutAttribute.left,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: self.mainView,
                                                  attribute: NSLayoutAttribute.left,
                                                  multiplier: 1,
                                                  constant: 0)
        
        let constraintHeightHeaderView = NSLayoutConstraint(item: headerView,
                                                            attribute: NSLayoutAttribute.height,
                                                            relatedBy: NSLayoutRelation.equal,
                                                            toItem: nil,
                                                            attribute: NSLayoutAttribute.height,
                                                            multiplier: 1,
                                                            constant: headerView.frame.height)
        
        self.constraintsToActivate.append(contentsOf: [
            distanceLeading,
            distanceTrailing,
            constraintHeightHeaderView])
    }
    
    /* MARK: Main View
     
     View Constraints */
    
    func setupMainViewConstraints() {
        
        self.mainView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainView)
        
        let distanceLeading = NSLayoutConstraint(item: mainView,
                                                 attribute: NSLayoutAttribute.right,
                                                 relatedBy: NSLayoutRelation.equal,
                                                 toItem: self.view,
                                                 attribute: NSLayoutAttribute.right,
                                                 multiplier: 1,
                                                 constant: 0)
        
        let distanceTrailing = NSLayoutConstraint(item: mainView,
                                                  attribute: NSLayoutAttribute.left,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: self.view,
                                                  attribute: NSLayoutAttribute.left,
                                                  multiplier: 1,
                                                  constant: 0)
        
        let distanceTop = NSLayoutConstraint(item: mainView,
                                             attribute: NSLayoutAttribute.top,
                                             relatedBy: NSLayoutRelation.equal,
                                             toItem: self.view,
                                             attribute: NSLayoutAttribute.top,
                                             multiplier: 1,
                                             constant: 20)
        
        let distanceBottom = NSLayoutConstraint(item: mainView,
                                                attribute: NSLayoutAttribute.bottom,
                                                relatedBy: NSLayoutRelation.equal,
                                                toItem: self.view,
                                                attribute: NSLayoutAttribute.bottom,
                                                multiplier: 1,
                                                constant: 0)
        
        
        
        self.constraintsToActivate.append(contentsOf: [
            distanceLeading,
            distanceTrailing,
            distanceTop,
            distanceBottom])
    }
    
    /* MARK: Search Bar Constraints */
    
    
    func setupSearchBarConstraints() {
        
        self.searchController.searchBar.subviews[0].subviews[0].translatesAutoresizingMaskIntoConstraints = false
        let constraintHeightSearchBarBackgroundView = NSLayoutConstraint(item: self.searchController.searchBar.subviews[0].subviews[0],
                                                                         attribute: NSLayoutAttribute.height,
                                                                         relatedBy: NSLayoutRelation.equal,
                                                                         toItem: self.searchController.searchBar,
                                                                         attribute: NSLayoutAttribute.height,
                                                                         multiplier: 1,
                                                                         constant: 0)
        let constraintWidthSearchBarBackgroundView = NSLayoutConstraint(item: self.searchController.searchBar.subviews[0].subviews[0],
                                                                        attribute: NSLayoutAttribute.width,
                                                                        relatedBy: NSLayoutRelation.equal,
                                                                        toItem: self.searchController.searchBar,
                                                                        attribute: NSLayoutAttribute.width,
                                                                        multiplier: 1,
                                                                        constant: 0)
        let distanceTop = NSLayoutConstraint(item: self.searchController.searchBar.subviews[0].subviews[0],
                                             attribute: NSLayoutAttribute.top,
                                             relatedBy: NSLayoutRelation.equal,
                                             toItem: self.searchController.searchBar,
                                             attribute: NSLayoutAttribute.top,
                                             multiplier: 1,
                                             constant: 0)
        
        let distanceBottom = NSLayoutConstraint(item: self.searchController.searchBar.subviews[0].subviews[0],
                                                attribute: NSLayoutAttribute.bottom,
                                                relatedBy: NSLayoutRelation.equal,
                                                toItem: self.searchController.searchBar,
                                                attribute: NSLayoutAttribute.bottom,
                                                multiplier: 1,
                                                constant: 0)
        
        self.constraintsToActivate.append(contentsOf: [
            constraintHeightSearchBarBackgroundView,
            constraintWidthSearchBarBackgroundView,
            distanceTop,
            distanceBottom])
    }
    
    // MARK: --- SETUP LABELS AND IMAGES CONSTRAINTS ---
    
    func setupLabelsTitlesAndImagesConstraints() {
        
        for (index, view) in tabViews.enumerated() {
            
            let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.alignment = .center
            stackView.spacing = distanceBetweenTabViewComponents
            stackView.isUserInteractionEnabled = true
            view.addSubview(stackView)
            
            /* -- StackView Constraints -- */
            
            let centerX = NSLayoutConstraint(item: stackView,
                                             attribute: NSLayoutAttribute.centerX,
                                             relatedBy: NSLayoutRelation.equal,
                                             toItem: view,
                                             attribute: NSLayoutAttribute.centerX,
                                             multiplier: 1,
                                             constant: 0)
            
            let distanceLeading = NSLayoutConstraint(item: stackView,
                                                     attribute: NSLayoutAttribute.right,
                                                     relatedBy: NSLayoutRelation.equal,
                                                     toItem: view,
                                                     attribute: NSLayoutAttribute.right,
                                                     multiplier: 1,
                                                     constant: -5)
            
            let distanceTrailing = NSLayoutConstraint(item: stackView,
                                                      attribute: NSLayoutAttribute.left,
                                                      relatedBy: NSLayoutRelation.equal,
                                                      toItem: view,
                                                      attribute: NSLayoutAttribute.left,
                                                      multiplier: 1,
                                                      constant: 5)
            
            let distanceTop = NSLayoutConstraint(item: stackView,
                                                 attribute: NSLayoutAttribute.top,
                                                 relatedBy: NSLayoutRelation.equal,
                                                 toItem: view,
                                                 attribute: NSLayoutAttribute.top,
                                                 multiplier: 1,
                                                 constant: distanceTabViewComponentsToSideBounds)
            
            let distanceBottom = NSLayoutConstraint(item: stackView,
                                                    attribute: NSLayoutAttribute.bottom,
                                                    relatedBy: NSLayoutRelation.equal,
                                                    toItem: view,
                                                    attribute: NSLayoutAttribute.bottom,
                                                    multiplier: 1,
                                                    constant: -distanceTabViewComponentsToSideBounds)
            
            self.constraintsToActivate.append(contentsOf: [
                centerX,
                distanceLeading,
                distanceTrailing,
                distanceTop,
                distanceBottom])
            
            if !tabViewsImages.isEmpty {
                let imageView = tabViewsImages[index]
                imageView.contentMode = UIViewContentMode.scaleAspectFill
                imageView.clipsToBounds = true
                imageView.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview(imageView)
                
                let constraintAspectRatioImageView = NSLayoutConstraint(item: tabViewsImages[index],
                                                                        attribute: NSLayoutAttribute.height,
                                                                        relatedBy: NSLayoutRelation.equal,
                                                                        toItem: tabViewsImages[index],
                                                                        attribute: NSLayoutAttribute.width,
                                                                        multiplier: tabViewsImages[index].frame.size.height/tabViewsImages[index].frame.size.width,
                                                                        constant: 0)
                
                let constraintWidthImageView = NSLayoutConstraint(item: tabViewsImages[index],
                                                                  attribute: NSLayoutAttribute.width,
                                                                  relatedBy: NSLayoutRelation.equal,
                                                                  toItem: nil,
                                                                  attribute: NSLayoutAttribute.width,
                                                                  multiplier: 1,
                                                                  constant: 25 * scaleFactorOfImageInTabView)
                
                self.constraintsToActivate.append(contentsOf: [
                    constraintAspectRatioImageView,
                    constraintWidthImageView])
            }
            
            if !tabViewsTitles.isEmpty {
                
                let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
                labelTitle.text = tabViewsTitles[index]
                if index == 0 {
                    labelTitle.textColor = self.colorOfTabViewTitlesInActiveState
                } else {
                    labelTitle.textColor = self.colorOfTabViewTitlesInInactiveState
                }
                labelTitle.tag = index
                labelTitle.textAlignment = .center
                labelTitle.baselineAdjustment = .alignCenters
                labelTitle.minimumScaleFactor = 0.2
                labelTitle.adjustsFontSizeToFitWidth = true
                labelTitle.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview(labelTitle)
                tabViewsTitlesLabels.append(labelTitle)
            }
        }
    }
    
    // MARK: --- SETUP TABVIEWS SEPARATOR ---
    
    func setupTabViewsSeparator() {
        
        if tabViewsSeparatorStyle == .singleLine {
            
            let sizeWidthOfTabViews = view.frame.width/CGFloat(numberOfTabs)
            for value in 1...numberOfTabs - 1 {
                
                let tabViewSeparator = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
                tabViewSeparator.backgroundColor = UIColor(colorLiteralRed: 225.0/255,
                                                           green: 228.0/255,
                                                           blue: 229.0/255,
                                                           alpha: 1.0)
                tabViewSeparator.translatesAutoresizingMaskIntoConstraints = false
                self.mainView.addSubview(tabViewSeparator)
                
                let constrainsDistanceToTopTabViewSeparator = NSLayoutConstraint(item: tabViewSeparator,
                                                                                 attribute: NSLayoutAttribute.top,
                                                                                 relatedBy: NSLayoutRelation.equal,
                                                                                 toItem: tabViews.first,
                                                                                 attribute: NSLayoutAttribute.top,
                                                                                 multiplier: 1,
                                                                                 constant: 0)
                
                let constrainsDistanceToBottomTabViewSeparator = NSLayoutConstraint(item: tabViewSeparator,
                                                                                    attribute: NSLayoutAttribute.bottom,
                                                                                    relatedBy: NSLayoutRelation.equal,
                                                                                    toItem: tabViews.first,
                                                                                    attribute: NSLayoutAttribute.bottom,
                                                                                    multiplier: 1,
                                                                                    constant: 0)
                
                let constraintWidthTabViewSeparator = NSLayoutConstraint(item: tabViewSeparator,
                                                                         attribute: NSLayoutAttribute.width,
                                                                         relatedBy: NSLayoutRelation.equal,
                                                                         toItem: nil,
                                                                         attribute: NSLayoutAttribute.width,
                                                                         multiplier: 1,
                                                                         constant: 0.5)
                
                let tabViewSeparatorDistanceToMarginLeft = NSLayoutConstraint(item: tabViewSeparator,
                                                                              attribute: NSLayoutAttribute.left,
                                                                              relatedBy: NSLayoutRelation.equal,
                                                                              toItem: self.mainView,
                                                                              attribute: NSLayoutAttribute.left,
                                                                              multiplier: 1,
                                                                              constant: CGFloat(value) * sizeWidthOfTabViews)
                
                NSLayoutConstraint.activate([
                    constrainsDistanceToTopTabViewSeparator,
                    constrainsDistanceToBottomTabViewSeparator,
                    constraintWidthTabViewSeparator,
                    tabViewSeparatorDistanceToMarginLeft])
            }
        }
    }
    
    func setupSwitchTabViewButtons() {
        
        for (index, tabView) in tabViews.enumerated() {
            
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = UIColor.clear
            button.addTarget(self, action: #selector(switchTabView(_:)), for: UIControlEvents.touchUpInside)
            button.tag = index
            mainView.addSubview(button)
            
            let constraintWidthButton = NSLayoutConstraint(item: button,
                                                           attribute: NSLayoutAttribute.right,
                                                           relatedBy: NSLayoutRelation.equal,
                                                           toItem: tabView,
                                                           attribute: NSLayoutAttribute.right,
                                                           multiplier: 1,
                                                           constant: 0)
            
            let constraintHeightButton = NSLayoutConstraint(item: button,
                                                            attribute: NSLayoutAttribute.left,
                                                            relatedBy: NSLayoutRelation.equal,
                                                            toItem: tabView,
                                                            attribute: NSLayoutAttribute.left,
                                                            multiplier: 1,
                                                            constant: 0)
            
            let constraintDistanceFirstTabViewToMarginLeft2 = NSLayoutConstraint(item: button,
                                                                                 attribute: NSLayoutAttribute.top,
                                                                                 relatedBy: NSLayoutRelation.equal,
                                                                                 toItem: tabView,
                                                                                 attribute: NSLayoutAttribute.top,
                                                                                 multiplier: 1,
                                                                                 constant: 0)
            
            let constraintCenterXButtonToTabView = NSLayoutConstraint(item: button,
                                                                      attribute: NSLayoutAttribute.bottom,
                                                                      relatedBy: NSLayoutRelation.equal,
                                                                      toItem: tabView,
                                                                      attribute: NSLayoutAttribute.bottom,
                                                                      multiplier: 1,
                                                                      constant: 0)
            
            self.constraintsToActivate.append(contentsOf: [
                constraintWidthButton,
                constraintHeightButton,
                constraintDistanceFirstTabViewToMarginLeft2,
                constraintCenterXButtonToTabView])
        }
    }
}
