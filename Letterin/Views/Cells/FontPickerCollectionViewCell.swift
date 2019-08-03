//
//  FontPickerCollectionViewCell.swift
//  Letterin
//
//  Created by Italo Boss on 01/08/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class FontPickerCollectionViewCell: UICollectionViewCell {
    
    var fontView = UIView()
    let fontLabel = UILabel()
    
    var font: UIFont = UIFont.systemFont(ofSize: 17) {
        didSet {
            fontLabel.font = font
            setNeedsDisplay()
        }
    }
    
    override var isSelected: Bool {
        didSet {
            fontView.backgroundColor = isSelected ? Colors.primary.value : .white
            fontLabel.textColor = isSelected ? .white : .black
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
        fontView.backgroundColor = .white
        fontLabel.text = "Aa"
        fontLabel.textAlignment = .center
        fontLabel.font = UIFont.systemFont(ofSize: 18)
        
        self.contentView.addSubview(fontView)
        self.contentView.addSubview(fontLabel)
        fontView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor)
        fontLabel.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor)
    }
    
}
