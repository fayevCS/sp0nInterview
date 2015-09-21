//
//  ViewController.swift
//  sp0nInterview
//
//  Created by Faye V on 9/18/15.
//  Copyright (c) 2015 Fayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Constants
    let kToggleHeight: CGFloat = 50
    let kSideMarginPadding: CGFloat = 20
    let kVeritcalMarginPadding: CGFloat = 50
    
    // Views and ViewControllers
    let problemToggle = UISegmentedControl(items: ["Products Problem", "Sum Pairs Problem"])
    let productsArrayViewController = ProductsArrayViewController()
    let sumPairsViewController = SumPairsViewController()
    var currentChildViewController: UIViewController? = Optional.None

// MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAndLayoutProblemToggle()
        
        productsArrayViewController.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        sumPairsViewController.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        showChildViewController(productsArrayViewController)
    }

// MARK: View add and layout functions
    
    func addAndLayoutProblemToggle() {
        problemToggle.setTranslatesAutoresizingMaskIntoConstraints(false)
        problemToggle.selectedSegmentIndex = 0
        problemToggle.addTarget(self, action: "switchChildControllerForSelection:", forControlEvents: UIControlEvents.ValueChanged)
        view.addSubview(problemToggle)
        
        problemToggle.setSize(CGSize(width: view.frame.size.width - 2 * kSideMarginPadding, height: kToggleHeight))
        problemToggle.alignXToCenterOfSuperview(0)
        problemToggle.alignToTopOfSuperview(kVeritcalMarginPadding)
    }

// MARK: Toggle action callback
    
    func switchChildControllerForSelection(sender: UISegmentedControl) {
        switch problemToggle.selectedSegmentIndex {
        case 0: showProductsArrayViewController()
        case 1: showSumPairsViewController()
        default: print("Invalid segment index")
        }
    }

// MARK: Private functions for switching between view controllers
    
    // Show child view controller by adding child viewcontroller to self.
    // This is Apple standard for encapsulating viewcontrollers when they
    // share the same view (i.e. not pushed onto navigation controller to
    // be presented stand-alone).
    func showChildViewController(childViewController: UIViewController) {
        addChildViewController(childViewController)
        view.addSubview(childViewController.view)
        
        childViewController.view.setWidth(view.frame.size.width)
        childViewController.view.alignXToCenterOfSuperview(0)
        childViewController.view.alignTopToBottomOfView(problemToggle, offset: kVeritcalMarginPadding / 2)
        childViewController.view.alignToBottomOfSuperview(0)
        
        childViewController.didMoveToParentViewController(self)
        currentChildViewController = childViewController
    }
    
    func hideChildViewController(childViewController: UIViewController) {
        if childViewController != Optional.None {
            childViewController.willMoveToParentViewController(Optional.None)
            childViewController.view.removeFromSuperview()
            childViewController.removeFromParentViewController()
            currentChildViewController = Optional.None
        }
    }
    
    func showProductsArrayViewController() {
        hideChildViewController(sumPairsViewController)
        showChildViewController(productsArrayViewController)
    }
    
    func showSumPairsViewController() {
        hideChildViewController(productsArrayViewController)
        showChildViewController(sumPairsViewController)
    }
    
// MARK: Misc

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

