//
//  SumPairsViewController.swift
//  
//
//  Created by Faye V on 9/18/15.
//
//

import UIKit

class SumPairsViewController: UIViewController {
    
    // Constants
    let kFontSize: CGFloat = 20
    let kButtonHeight: CGFloat = 50
    let kButtonWidth: CGFloat = 200
    let kTextFieldWidth: CGFloat = 180
    let kSideMarginPadding: CGFloat = 20
    let kVeritcalMarginPadding: CGFloat = 10
    let kCornerRadius: CGFloat = 5
    let kTextViewBackgroundColor: UIColor = UIColor(white: 0.95, alpha: 1)
    
    // Views
    let selectArrayLabel = UILabel(frame: CGRectZero)
    let sampleArrayButton0 = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let sampleArrayButton1 = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let enterSumLabel = UILabel(frame: CGRectZero)
    let enterSumTextField = UITextField(frame: CGRectZero)
    let findSumPairButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let sumPairsResultTextView = UITextView(frame: CGRectZero)
    
    // Variables
    var selectedArray: Int = 0
    let sampleArray0 = [1, 2, 3, 4, 5]
    let sampleArray1 = [3, 12, 70, 7, 9, 7]

// MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        addDismissKeyboardButton()
        setupViewsAndLayout()
        selectArray(sampleArrayButton0)
        
        // Console tests
        var intArr = [1, 5]
        var (exists, int1, int2) = containsSumPair(7, intArr: intArr)
        print("exists: \(exists)\n")
        
        var intArr2 = [3, 4, 5, 5]
        var (exists2, int2_1, int2_2) = containsSumPair(10, intArr: intArr2)
        print("exists: \(exists2)\n")
        
        var intArr3 = [3]
        var (exists3, int3_1, int3_2) = containsSumPair(6, intArr: intArr3)
        print("exists: \(exists3)\n")
        
        var intArr4 = [14, 90, 6, 32, 2]
        var (exists4, int4_1, int4_2) = containsSumPair(104, intArr: intArr4)
        print("exists: \(exists4)\n")
    }
    
// MARK: View add and layout functions
    
    func setupViewsAndLayout() {
        sampleArrayButtonViews()
        enterSumViews()
        findAndResultViews()
    }
    
    // Add subviews and autolayout "selectArrayLabel", "sampleArrayButton0", and "sampleArrayButton1
    func sampleArrayButtonViews() {
        selectArrayLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        selectArrayLabel.text = "Select an array:"
        selectArrayLabel.font = UIFont(name: "Arial", size: kFontSize)
        selectArrayLabel.textAlignment = NSTextAlignment.Center
        view.addSubview(selectArrayLabel)
        
        selectArrayLabel.setHeight(kButtonHeight)
        selectArrayLabel.alignXToCenterOfSuperview(0)
        selectArrayLabel.alignToTopOfSuperview(0)
        
        sampleArrayButton0.setTranslatesAutoresizingMaskIntoConstraints(false)
        sampleArrayButton0.setTitle(sampleArray0.description, forState: UIControlState.Normal)
        sampleArrayButton0.titleLabel?.font = UIFont(name: "Arial", size: kFontSize)
        sampleArrayButton0.layer.cornerRadius = kCornerRadius
        sampleArrayButton0.addTarget(self, action: "selectArray:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(sampleArrayButton0)
        
        sampleArrayButton0.setSize(CGSize(width: kButtonWidth, height: kButtonHeight))
        sampleArrayButton0.alignXToCenterOfSuperview(0)
        sampleArrayButton0.alignTopToBottomOfView(selectArrayLabel, offset: 0)
        
        sampleArrayButton1.setTranslatesAutoresizingMaskIntoConstraints(false)
        sampleArrayButton1.setTitle(sampleArray1.description, forState: UIControlState.Normal)
        sampleArrayButton1.titleLabel?.font = UIFont(name: "Arial", size: kFontSize)
        sampleArrayButton1.layer.cornerRadius = kCornerRadius
        sampleArrayButton1.addTarget(self, action: "selectArray:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(sampleArrayButton1)
        
        sampleArrayButton1.setSize(CGSize(width: kButtonWidth, height: kButtonHeight))
        sampleArrayButton1.alignXToCenterOfSuperview(0)
        sampleArrayButton1.alignTopToBottomOfView(sampleArrayButton0, offset: kVeritcalMarginPadding)
    }
    
    // Add subviews and autolayout "enterSumLabel" and "enterSumTextField"
    func enterSumViews() {
        enterSumLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        enterSumLabel.text = "Sum to find:"
        enterSumLabel.font = UIFont(name: "Arial", size: kFontSize)
        view.addSubview(enterSumLabel)
        
        enterSumLabel.setHeight(kButtonHeight)
        enterSumLabel.alignLeftToSuperview(kSideMarginPadding)
        enterSumLabel.alignTopToBottomOfView(sampleArrayButton1, offset: kVeritcalMarginPadding * 2)
        
        enterSumTextField.setTranslatesAutoresizingMaskIntoConstraints(false)
        enterSumTextField.keyboardType = UIKeyboardType.NumberPad
        enterSumTextField.backgroundColor = kTextViewBackgroundColor
        enterSumTextField.placeholder = "Sum"
        enterSumTextField.textAlignment = NSTextAlignment.Center
        enterSumTextField.layer.cornerRadius = kCornerRadius
        view.addSubview(enterSumTextField)
        
        enterSumTextField.setSize(CGSizeMake(kTextFieldWidth, kButtonHeight))
        enterSumTextField.alignLeftToRightOfView(enterSumLabel, offset: kSideMarginPadding * 2)
        enterSumTextField.alignTopsOfViews(enterSumLabel, offset: 0)
    }
    
    // Add subviews and autolayout "findSumPairButton" and "sumPairsResultTextView"
    func findAndResultViews() {
        findSumPairButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        findSumPairButton.setTitle("Find Sum Pair", forState: UIControlState.Normal)
        findSumPairButton.titleLabel?.font = UIFont(name: "Arial", size: kFontSize)
        findSumPairButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
        findSumPairButton.addTarget(self, action: "findSumPair:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(findSumPairButton)
        
        findSumPairButton.setSize(CGSizeMake(kButtonWidth, kButtonHeight))
        findSumPairButton.alignXToCenterOfSuperview(0)
        findSumPairButton.alignTopToBottomOfView(enterSumLabel, offset: kVeritcalMarginPadding * 2)
        
        sumPairsResultTextView.setTranslatesAutoresizingMaskIntoConstraints(false)
        sumPairsResultTextView.backgroundColor = kTextViewBackgroundColor
        sumPairsResultTextView.font = UIFont(name: "Arial", size: kFontSize)
        sumPairsResultTextView.editable = false
        sumPairsResultTextView.layer.cornerRadius = kCornerRadius
        view.addSubview(sumPairsResultTextView)
        
        sumPairsResultTextView.setSize(CGSizeMake(view.bounds.size.width - (kSideMarginPadding * 2), kButtonHeight * 2))
        sumPairsResultTextView.alignLeftToSuperview(kSideMarginPadding)
        sumPairsResultTextView.alignTopToBottomOfView(findSumPairButton, offset: kVeritcalMarginPadding)
    }
    
// MARK: Dismiss keyboard functions for tapping anywhere in the view
    
    func addDismissKeyboardButton() {
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: "dismissKeyboard:")
        view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    func dismissKeyboard(sender: UITapGestureRecognizer) {
        enterSumTextField.resignFirstResponder()
    }

// MARK: Button callback functions
    
    // Select and deselect between 2 sample arrays
    func selectArray(sender: UIButton) {
        if sender == sampleArrayButton0 {
            sampleArrayButton0.backgroundColor = UIColor.yellowColor()
            sampleArrayButton1.backgroundColor = UIColor.clearColor()
            selectedArray = 0
        } else if sender == sampleArrayButton1 {
            sampleArrayButton0.backgroundColor = UIColor.clearColor()
            sampleArrayButton1.backgroundColor = UIColor.yellowColor()
            selectedArray = 1
        }
    }
    
    // Called when user selects find button.
    func findSumPair(sender: UIButton) {
        enterSumTextField.resignFirstResponder()
        var (exists, int1, int2) = (false, -1, -1)
        var sumToFind: Int
        
        // Check for valid number in "enterSumTextField"
        if enterSumTextField.text != "" {
            sumToFind = enterSumTextField.text.toInt()!
            if selectedArray == 0 {
                (exists, int1, int2) = containsSumPair(sumToFind, intArr: sampleArray0)
            } else if selectedArray == 1 {
                (exists, int1, int2) = containsSumPair(sumToFind, intArr: sampleArray1)
            }
        } else {
            sumPairsResultTextView.text = "Please enter a sum to find in the field above."
            return
        }
        
        // Show user result
        if (exists) {
            sumPairsResultTextView.text = "A pair for that sum exists! \(sumToFind) = \(int1) + \(int2)"
        } else {
            sumPairsResultTextView.text = "A pair for that sum does not exist."
        }
    }
    
// MARK: Main solution for finding if a sum pair exists in an array given n
    
    func containsSumPair(n : Int, intArr : [Int]) -> (Bool, Int, Int) {
        // Hash intArr values with index
        var intDictionary = Dictionary<Int, Int>()
        for var i = 0; i < intArr.count; i++ {
            intDictionary[intArr[i]] = i
        }
        
        // Search for sum pairs by looping over intArr and finding the
        // difference in intDictionary (hash table)
        for var i = 0; i < intArr.count; i++ {
            let hasDifference = intDictionary.indexForKey(n - intArr[i])
            let indexForDifference = intDictionary[n - intArr[i]]
            
            if hasDifference != nil && indexForDifference != i {
                return (true, intArr[i], n - intArr[i])
            }
        }
        
        return (false, -1, -1)
    }

// MARK: Misc
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
