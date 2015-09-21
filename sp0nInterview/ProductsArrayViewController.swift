//
//  ProductsArrayViewController.swift
//  sp0nInterview
//
//  Created by Faye V on 9/18/15.
//  Copyright (c) 2015 Fayev. All rights reserved.
//

import UIKit

class ProductsArrayViewController: UIViewController {
    
    // Constants
    let kNumberInputLimit = 10
    let kSideMarginPadding: CGFloat = 10
    let kVeritcalMarginPadding: CGFloat = 20
    let kTextViewWidth: CGFloat = 175
    let kTextViewHeight: CGFloat = 50
    let kFontSize: CGFloat = 20
    let kFontSizeLarge: CGFloat = 28
    let kTextViewBackgroundColor: UIColor = UIColor(white: 0.95, alpha: 1)
    let kCornerRadius: CGFloat = 5
    
    // Views
    let enterNumberTextField = UITextField(frame: CGRectZero)
    let addNumberButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let enteredNumbersTextView = UITextView(frame: CGRectZero)
    let computeProductsButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let resultTextView = UITextView(frame: CGRectZero)
    
    // Data source array
    var intArray = [Int]()

// MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewsAndLayout()

        // Console tests
        productsArray([1, 2, 3, 4, 5])
        // [120, 60, 40, 30, 24]
        
        productsArray([1, 3, 9, 6, 25, 1, 2, 4])
        //[32400, 10800, 3600, 5400, 1296, 32400, 16200, 8100]
    }

// MARK: View add and layout functions
    
    func setupViewsAndLayout() {
        addToIntArrayViews()
        displayAndComputeResultViews()
    }
    
    // Add subviews and autolayout "enterNumberTextField" and "addNumberButton"
    func addToIntArrayViews() {
        enterNumberTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        enterNumberTextField.keyboardType = UIKeyboardType.NumberPad
        enterNumberTextField.backgroundColor = kTextViewBackgroundColor
        enterNumberTextField.layer.cornerRadius = kCornerRadius
        enterNumberTextField.placeholder = "Enter number"
        view.addSubview(enterNumberTextField)
        
        enterNumberTextField.setSize(CGSizeMake(kTextViewWidth, kTextViewHeight))
        enterNumberTextField.alignLeftToSuperview(kSideMarginPadding)
        enterNumberTextField.alignToTopOfSuperview(0)
        
        addNumberButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        addNumberButton.setTitle("Add Number", forState: UIControlState.Normal)
        addNumberButton.titleLabel?.font = UIFont(name: "Arial", size: kFontSize)
        addNumberButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        addNumberButton.addTarget(self, action: "appendNumber:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(addNumberButton)
        
        addNumberButton.setSize(CGSizeMake(kTextViewWidth, kTextViewHeight))
        addNumberButton.alignLeftToRightOfView(enterNumberTextField, offset: kSideMarginPadding * 4)
        addNumberButton.alignToTopOfSuperview(0)
    }
    
    // Add subviews and autolayout "enteredNumbersTextView", "computeProductsButton", 
    // and "resultTextView"
    func displayAndComputeResultViews() {
        enteredNumbersTextView.setTranslatesAutoresizingMaskIntoConstraints(false)
        enteredNumbersTextView.backgroundColor = kTextViewBackgroundColor
        enteredNumbersTextView.font = UIFont(name: "Arial", size: kFontSize)
        enteredNumbersTextView.editable = false
        enteredNumbersTextView.layer.cornerRadius = kCornerRadius
        view.addSubview(enteredNumbersTextView)
        
        enteredNumbersTextView.setSize(CGSizeMake(kTextViewWidth, kTextViewHeight * 2))
        enteredNumbersTextView.alignLeftToSuperview(kSideMarginPadding)
        enteredNumbersTextView.alignTopToBottomOfView(enterNumberTextField, offset: kVeritcalMarginPadding)
        
        computeProductsButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        computeProductsButton.setTitle("Compute", forState: UIControlState.Normal)
        computeProductsButton.titleLabel?.font = UIFont(name: "Arial", size: kFontSizeLarge)
        computeProductsButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        computeProductsButton.addTarget(self, action: "computeProducts:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(computeProductsButton)
        
        computeProductsButton.setSize(CGSizeMake(kTextViewWidth, kTextViewHeight))
        computeProductsButton.alignLeftToRightOfView(enteredNumbersTextView, offset: kSideMarginPadding * 4)
        computeProductsButton.alignTopsOfViews(enteredNumbersTextView, offset: 0)
        
        resultTextView.setTranslatesAutoresizingMaskIntoConstraints(false)
        resultTextView.backgroundColor = kTextViewBackgroundColor
        resultTextView.font = UIFont(name: "Arial", size: kFontSize)
        resultTextView.editable = false
        resultTextView.layer.cornerRadius = kCornerRadius
        view.addSubview(resultTextView)
        
        resultTextView.setSize(CGSizeMake(view.bounds.size.width - (kSideMarginPadding * 4), kTextViewHeight * 2))
        resultTextView.alignLeftToSuperview(kSideMarginPadding)
        resultTextView.alignTopToBottomOfView(enteredNumbersTextView, offset: kVeritcalMarginPadding)
    }

// MARK: Button action functions
    
    // Callback for "addNumberButton". Add number to "intArray", clear "enterNumberTextField",
    // and display current values in "intArray" in "enteredNumbersTextView"
    func appendNumber(sender: UIButton) {
        if (enterNumberTextField.text != "" && intArray.count < kNumberInputLimit) {
            intArray.append(enterNumberTextField.text.toInt()!)
            enterNumberTextField.text = ""
            enteredNumbersTextView.text = intArray.description
        }
    }
    
    // Callback for computeProductsButton. Generate result from "productsArray()" on "intArray"
    // and display result in "resultTextView". 
    // Note: Clears "intArray" on compute. Computation only valid for "intArray.count > 1".
    func computeProducts(sender: UIButton) {
        if (intArray.count > 1) {
            let productsResult = productsArray(intArray)
            resultTextView.text = productsResult.description
            intArray.removeAll(keepCapacity: false)
        }
    }

// MARK: Compute products array
    
    // Main function for computing result for the products problem.
    // First we cache the products in the array in ascending and descending
    // order. Then we iterate over the array and use the cached
    // products to compute the product for that position.
    // Time complexity: O(n)
    func productsArray(nums : [Int]) -> [Int] {
        var (ascendingProducts, descendingProducts) = cacheProducts(nums)
        
        var productsArray : [Int] = [Int]()
        for var index = 0; index < nums.count; index++ {
            if (index == 0) {
                productsArray.append(descendingProducts[descendingProducts.count - 1])
            } else if (index == nums.count - 1) {
                productsArray.append(ascendingProducts[ascendingProducts.count - 1])
            } else {
                productsArray.append(ascendingProducts[index - 1] * descendingProducts[nums.count - index - 2])
            }
        }
        
        print("products: \(productsArray)\n")
        
        return productsArray
    }
    
    // Cache the products up to that particular index in ascending and
    // descending order.
    func cacheProducts(nums : [Int]) -> ([Int], [Int]) {
        var ascendingProducts : [Int] = [Int]()
        var currentAscendingProduct = 1
        for var index = 0; index < nums.count - 1; index++ {
            currentAscendingProduct *= nums[index]
            ascendingProducts.append(currentAscendingProduct)
        }
        
        var descendingProducts : [Int] = [Int]()
        var currentDescendingProduct = 1
        for var index = nums.count - 1; index > 0; index-- {
            currentDescendingProduct *= nums[index]
            descendingProducts.append(currentDescendingProduct)
        }
        
        return (ascendingProducts, descendingProducts)
    }
    
// MARK: Misc

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
