//
//  CenterCurvedOneTemplate.swift
//  Letterin
//
//  Created by Italo Boss on 02/08/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class CenterCurvedOneTemplate: UIImageView {

    var topSmallSection = LetteringSectionView()
    var topSection = LetteringSectionView()
    var centerCurvedSection = LetteringSectionView()
    var bottomSmallSection = LetteringSectionView()
    var bottomSection = LetteringSectionView()
    
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
        self.addSubview(topSmallSection)
        self.addSubview(topSection)
        self.addSubview(centerCurvedSection)
        self.addSubview(bottomSmallSection)
        self.addSubview(bottomSection)
        
        topSmallSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 150, width: 250, height: 60)
        topSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 100, width: 100, height: 30)
        centerCurvedSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 10, width: 250, height: 60)
        bottomSmallSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 90, width: 220, height: 60)
        bottomSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 140, width: 220, height: 60)

        topSmallSection.radius = 10000
        
        topSection.fontSize = 36.0
        topSection.radius = 10000
        
        centerCurvedSection.radius = 220
        centerCurvedSection.fontSize = 56.0
        
        bottomSmallSection.radius = 10000
        
        bottomSection.radius = 10000
        bottomSection.fontSize = 36.0
    }
    
    func setupTemplateInteraction() {
        self.isUserInteractionEnabled = true
        topSmallSection.isUserInteractionEnabled = true
        topSection.isUserInteractionEnabled = true
        centerCurvedSection.isUserInteractionEnabled = true
        bottomSmallSection.isUserInteractionEnabled = true
        bottomSection.isUserInteractionEnabled = true
    }
    
}
