//
//  LetteringSectionView.swift
//  Letterin
//
//  Created by Italo Boss on 26/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class LetteringSectionView: UIView {
    
    private let placeholderText = "Tap to edit"
    private let placeholderTextColor = UIColor.darkGray.withAlphaComponent(0.6)
    private let placeholderFont = UIFont.systemFont(ofSize: 21)
    
    var text: String? = nil {
        didSet { setNeedsDisplay() }
    }
    var angle: CGFloat = -90 {
        didSet { setNeedsDisplay() }
    }
    var radius: CGFloat = 120 {
        didSet { setNeedsDisplay() }
    }
    var textColor: UIColor? = nil {
        didSet { setNeedsDisplay() }
    }
    var fontName: String? = nil {
        didSet { setNeedsDisplay() }
    }
    var fontSize: CGFloat = 21 {
        didSet { setNeedsDisplay() }
    }
    
    override func draw(_ rect: CGRect) {
        layer.sublayers?.removeAll()
        drawCurvedString(
            text: NSAttributedString(
                string: text ?? placeholderText,
                attributes: [
                    .foregroundColor: textColor ?? placeholderTextColor,
                    .font: UIFont(name: fontName ?? ".SFUIDisplay", size: fontSize) ?? placeholderFont
            ]),
            angle: angle,
            radius: radius
        )
    }
    
    func drawCurvedString(text: NSAttributedString, angle: CGFloat, radius: CGFloat) {
        var radAngle = angle.radians
        
        let textSize = text.boundingRect(
            with: CGSize(width: .max, height: .max),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil)
            .integral
            .size
        
        let perimeter: CGFloat = 2 * .pi * radius
        let textAngle: CGFloat = textSize.width / perimeter * 2 * .pi
        
        var textRotation: CGFloat = 0
        var textDirection: CGFloat = 0
        
        if angle > CGFloat(10).radians, angle < CGFloat(170).radians {
            // bottom string
            textRotation = 0.5 * .pi
            textDirection = -2 * .pi
            radAngle += textAngle / 2
        } else {
            // top string
            textRotation = 1.5 * .pi
            textDirection = 2 * .pi
            radAngle -= textAngle / 2
        }
        
        let centerLayerY = layer.frame.midY
        
        let dx: CGFloat = -15
        for c in 0..<text.length {
            let letter = text.attributedSubstring(from: NSRange(c..<c+1))
            let realCharSize = letter.boundingRect(
                with: CGSize(width: .max, height: .max),
                options: [.usesLineFragmentOrigin, .usesFontLeading],
                context: nil)
                .integral
                .size
            let charSize = letter.boundingRect(
                with: CGSize(width: .max, height: .max),
                options: [.usesLineFragmentOrigin, .usesFontLeading],
                context: nil)
                .insetBy(dx: dx, dy: 0)
                .size
            
            let charWidth = realCharSize.width
            
            let letterAngle = (charWidth / perimeter) * textDirection
            let x = radius * cos(radAngle + (letterAngle / 2)) + dx
            let y = radius * sin(radAngle + (letterAngle / 2))
            
            let xLetter = (layer.frame.size.width / 2) - (charWidth / 2) + x
            let yLetter = (layer.frame.size.height / 2) - (charSize.height / 2) + y
            
            let singleChar = drawText(
                text: letter,
                frame: CGRect(
                    x: xLetter,
                    y: yLetter > centerLayerY ? yLetter - radius : yLetter + radius,
                    width: charSize.width,
                    height: charSize.height))
            layer.addSublayer(singleChar)
            singleChar.transform = CATransform3DMakeAffineTransform(CGAffineTransform(rotationAngle: radAngle - textRotation))
            radAngle += letterAngle
        }
    }
    
    private func drawText(text: NSAttributedString, frame: CGRect) -> CATextLayer {
        let textLayer = CATextLayer()
        textLayer.frame = frame
        textLayer.string = text
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.contentsScale = UIScreen.main.scale
        return textLayer
    }

}
