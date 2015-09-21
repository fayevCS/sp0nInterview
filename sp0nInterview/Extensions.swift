//
//  Extensions.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Faye Villaroman
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

extension UIView {

// MARK: Size constraints
    
    func setSize(size: CGSize) {
        let widthConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: size.width)
        self.superview?.addConstraint(widthConstraint)
        
        let heightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: size.height)
        self.superview?.addConstraint(heightConstraint)
    }
    
    func setWidth(width: CGFloat) {
        let widthConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: width)
        self.superview?.addConstraint(widthConstraint)
    }
    
    func setHeight(height: CGFloat) {
        let heightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: height)
        self.superview?.addConstraint(heightConstraint)
    }

// MARK: Align to superview constraints
    
    func alignXToCenterOfSuperview(offset: CGFloat) {
        let centerXConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: offset)
        self.superview?.addConstraint(centerXConstraint)
    }
    
    func alignToBottomOfSuperview(offset: CGFloat) {
        let bottomConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: offset)
        self.superview?.addConstraint(bottomConstraint)
    }
    
    func alignToTopOfSuperview(offset: CGFloat) {
        let topConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: offset)
        self.superview?.addConstraint(topConstraint)
    }
    
    func alignRightToSuperview(offset: CGFloat) {
        let rightConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.RightMargin,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.RightMargin,
            multiplier: 1,
            constant: offset)
        self.superview?.addConstraint(rightConstraint)
    }
    
    func alignLeftToSuperview(offset: CGFloat) {
        let leftConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.LeftMargin,
            relatedBy: NSLayoutRelation.Equal,
            toItem: self.superview,
            attribute: NSLayoutAttribute.LeftMargin,
            multiplier: 1,
            constant: offset)
        self.superview?.addConstraint(leftConstraint)
    }
    
// MARK: Relative view contraints
    
    func alignTopToBottomOfView(toView: UIView, offset: CGFloat) {
        let topConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toView,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: offset)
        self.superview?.addConstraint(topConstraint)
    }
    
    func alignBottomToTopOfView(toView: UIView, offset: CGFloat) {
        let bottomConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toView,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: offset)
        self.superview?.addConstraint(bottomConstraint)
    }
    
    func alignLeftToRightOfView(toView: UIView, offset: CGFloat) {
        let leftConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.LeftMargin,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toView,
            attribute: NSLayoutAttribute.RightMargin,
            multiplier: 1,
            constant: offset)
        self.superview?.addConstraint(leftConstraint)
    }
    
    func alignTopsOfViews(toView: UIView, offset: CGFloat) {
        let topConstraint:NSLayoutConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: toView,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: offset)
        self.superview?.addConstraint(topConstraint)
    }
}