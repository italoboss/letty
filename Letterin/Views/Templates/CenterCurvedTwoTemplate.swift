//
//  CenterCurvedTwoTemplate.swift
//  Letterin
//
//  Created by Italo Boss on 02/08/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class CenterCurvedTwoTemplate: UIImageView, LettyTemplating {

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
        
        topSmallSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 160, width: 250, height: 60)
        topSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 100, width: 100, height: 30)
        centerCurvedSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, width: 250, height: 60)
        bottomSmallSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 90, width: 220, height: 60)
        bottomSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 150, width: 220, height: 60)
        
        topSmallSection.radius = 10000
        
        topSection.fontSize = 42.0
        topSection.radius = 10000
        
        centerCurvedSection.angle = 90
        centerCurvedSection.radius = 260
        centerCurvedSection.fontSize = 60.0
        
        bottomSmallSection.radius = 10000
        bottomSmallSection.fontSize = 46.0
        
        bottomSection.radius = 10000
        bottomSection.fontSize = 42.0
    }
    
    func setupTemplateInteraction() {
        self.isUserInteractionEnabled = true
        topSmallSection.isUserInteractionEnabled = true
        topSection.isUserInteractionEnabled = true
        centerCurvedSection.isUserInteractionEnabled = true
        bottomSmallSection.isUserInteractionEnabled = true
        bottomSection.isUserInteractionEnabled = true
    }
    
    func fill(template: LettyTemplate) {
        let lenght = 5
        guard
            let sections = template.sections,
            sections.count >= lenght
            else {
            return
        }
        
        let topSmall = sections[0]
        topSmallSection.text = topSmall.text
        topSmallSection.fontName = topSmall.font.name
        topSmallSection.textColor = topSmall.color.value
        
        let top = sections[1]
        topSection.text = top.text
        topSection.fontName = top.font.name
        topSection.textColor = top.color.value
        
        let centerCurved = sections[2]
        centerCurvedSection.text = centerCurved.text
        centerCurvedSection.fontName = centerCurved.font.name
        centerCurvedSection.textColor = centerCurved.color.value
        
        let bottomSmall = sections[3]
        bottomSmallSection.text = bottomSmall.text
        bottomSmallSection.fontName = bottomSmall.font.name
        bottomSmallSection.textColor = bottomSmall.color.value
        
        let bottom = sections[4]
        bottomSection.text = bottom.text
        bottomSection.fontName = bottom.font.name
        bottomSection.textColor = bottom.color.value
    }
    
}
