//
//  LettyBgCollectionViewCell.swift
//  Letterin
//
//  Created by Italo Boss on 27/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class LettyBgCollectionViewCell: UICollectionViewCell {
 
    private let container = UIView()
    var coverView = UIImageView()
    
    override var isSelected: Bool {
        didSet {
            //container.anchor(top: contentView.topAnchor, paddingTop: isSelected ? 0 : 8)
            container.heightConstaint?.constant = isSelected ? 125 : 117
            coverView.layer.shadowColor = isSelected ? UIColor.black.cgColor : UIColor.clear.cgColor
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
        coverView.layer.shadowColor = UIColor.clear.cgColor
        coverView.layer.shadowOpacity = 0.4
        coverView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        
        container.addSubview(coverView)
        coverView.anchor(top: container.topAnchor, left: container.leftAnchor, right: container.rightAnchor, height: 117)
        
        contentView.addSubview(container)
        container.anchor(left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, height: 117)
    }
    
}
