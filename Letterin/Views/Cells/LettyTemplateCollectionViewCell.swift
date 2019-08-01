//
//  LettyTemplateCollectionViewCell.swift
//  Letterin
//
//  Created by Italo Boss on 26/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class LettyTemplateCollectionViewCell: UICollectionViewCell {
    
    var coverView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    func setupLayout() {
        coverView.backgroundColor = .white
        self.backgroundView = coverView
        
        self.backgroundView?.layer.cornerRadius = 4
        self.backgroundView?.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 4).cgPath
        
        self.layer.masksToBounds = false
    }
    
}
