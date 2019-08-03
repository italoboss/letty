//
//  SimpleOneTemplate.swift
//  Letterin
//
//  Created by Italo Boss on 26/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class SimpleOneTemplate: UIImageView {

    var topSection = LetteringSectionView()
    var smallSection = LetteringSectionView()
    var middleSection = LetteringSectionView()
    var bottomSection = LetteringSectionView()
    var lastSection = LetteringSectionView()
    
    required init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        setupTemplateLayout()
        setupTemplateInteraction()
    }
    
    func setupTemplateLayout() {
        self.addSubview(topSection)
        self.addSubview(smallSection)
        self.addSubview(middleSection)
        self.addSubview(bottomSection)
        self.addSubview(lastSection)
        
        topSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 160, width: 250, height: 60)
        smallSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 90, width: 100, height: 30)
        middleSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 20, width: 250, height: 60)
        bottomSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 45, width: 220, height: 60)
        lastSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 95, width: 220, height: 60)
        
//        topSection.backgroundColor = .lightGray
//        smallSection.backgroundColor = .lightGray
//        middleSection.backgroundColor = .lightGray
//        bottomSection.backgroundColor = .lightGray
        
        topSection.fontSize = 54
        topSection.radius = 200
        
        smallSection.radius = 10000
        
        middleSection.radius = 10000
        middleSection.fontSize = 60
        
        bottomSection.radius = 10000
        bottomSection.fontSize = 42
        
        lastSection.radius = 10000
    }
    
    func setupTemplateInteraction() {
        self.isUserInteractionEnabled = true
        topSection.isUserInteractionEnabled = true
        smallSection.isUserInteractionEnabled = true
        middleSection.isUserInteractionEnabled = true
        bottomSection.isUserInteractionEnabled = true
        lastSection.isUserInteractionEnabled = true
    }
    
}
