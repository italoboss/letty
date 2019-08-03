//
//  CircleOneTemplate.swift
//  Letterin
//
//  Created by Italo Boss on 03/08/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class CircleOneTemplate: UIImageView {

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
        
        topSmallSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 170, width: 250, height: 60)
        topSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 80, width: 100, height: 30)
        centerCurvedSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, width: 250, height: 60)
        bottomSmallSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 70, width: 220, height: 60)
        bottomSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 170, width: 220, height: 60)
        
        topSmallSection.radius = 260
        topSmallSection.fontSize = 60
        
        topSection.radius = 10000
        topSection.fontSize = 38
        
        centerCurvedSection.radius = 10000
        centerCurvedSection.fontSize = 52
        
        bottomSmallSection.radius = 10000
        bottomSmallSection.fontSize = 38
        
        bottomSection.angle = 90
        bottomSection.radius = 260
        bottomSection.fontSize = 60
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
