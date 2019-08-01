//
//  ColorPickerCollectionViewCell.swift
//  Letterin
//
//  Created by Italo Boss on 31/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class ColorPickerCollectionViewCell: UICollectionViewCell {
    
    var colorView = UIView()
    private let size: CGFloat = 30.0
    
    var color: UIColor = .darkGray {
        didSet {
            colorView.backgroundColor = color
            setNeedsDisplay()
        }
    }
    
    override var isSelected: Bool {
        didSet {
            colorView.layer.borderWidth = isSelected ? 3 : 0
            colorView.layer.shadowColor = isSelected ? UIColor.black.cgColor : UIColor.clear.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        colorView.layer.borderColor = UIColor.white.cgColor
        colorView.layer.cornerRadius = size/2
        colorView.backgroundColor = color
        
        colorView.layer.shadowColor = UIColor.clear.cgColor
        colorView.layer.shadowOpacity = 0.2
        colorView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        colorView.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: size/2).cgPath
        
        self.contentView.addSubview(colorView)
        colorView.anchor(centerX: centerXAnchor, centerY: centerYAnchor, width: size, height: size)
    }
    
}
