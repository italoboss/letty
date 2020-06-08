//
//  UIView.swift
//  Letterin
//
//  Created by Italo Boss on 26/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Anchoring views with constraints
extension UIView {
    enum ConstraintType {
        case equal
        case greaterThanOrEqual
        case lessThanOrEqual
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,
                centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil,
                paddingTop: CGFloat? = nil, paddingLeft: CGFloat? = nil,
                paddingBottom: CGFloat? = nil, paddingRight: CGFloat? = nil,
                width: CGFloat? = nil, height: CGFloat? = nil, aspectRatio: CGFloat? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop ?? 0).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft ?? 0).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -(paddingBottom ?? 0)).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -(paddingRight ?? 0)).isActive = true
        }
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX, constant: (paddingLeft ?? 0) - (paddingRight ?? 0)).isActive = true
        }
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY, constant: (paddingTop ?? 0) - (paddingBottom ?? 0)).isActive = true
        }
        
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let aspectRatio = aspectRatio {
            self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: aspectRatio).isActive = true
        }
    }
}

extension UIView: PropertyConcatenate {}

// MARK: - Properties for Width and Height Constraint
extension UIView {
    
    var heightConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .height && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
    var widthConstaint: NSLayoutConstraint? {
        get {
            return constraints.first(where: {
                $0.firstAttribute == .width && $0.relation == .equal
            })
        }
        set { setNeedsLayout() }
    }
    
}

// MARK: - Get UIView as a UIImage
extension UIView {
    
    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
    
}
