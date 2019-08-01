//
//  CanvasView.swift
//  Letterin
//
//  Created by Italo Boss on 25/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class CanvasView: UIImageView {

    func drawString(_ text: String, size: CGFloat, color: UIColor, in rect: CGRect) {
        
        UIGraphicsBeginImageContext(self.frame.size)
//        guard let context = UIGraphicsGetCurrentContext() else {
//            return
//        }
        self.image?.draw(in: self.bounds)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        
        let attributes: [NSAttributedString.Key : Any] = [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: size),
            .foregroundColor: color
        ]
        
        text.draw(with: rect, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
}
