//
//  BasicOneTemplate.swift
//  Letterin
//
//  Created by Italo Boss on 03/08/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class BasicOneTemplate: UIImageView, LettyTemplating {

    var topSection = LetteringSectionView()
    var smallSection = LetteringSectionView()
    var middleSection = LetteringSectionView()
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
        self.addSubview(topSection)
        self.addSubview(smallSection)
        self.addSubview(middleSection)
        self.addSubview(bottomSection)
        
        topSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 110, width: 250, height: 60)
        middleSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingBottom: 30, width: 250, height: 60)
        smallSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 50, width: 100, height: 30)
        bottomSection.anchor(centerX: centerXAnchor, centerY: centerYAnchor, paddingTop: 110, width: 220, height: 60)
        
        topSection.radius = 10000
        topSection.fontSize = 52
        
        middleSection.radius = 200
        middleSection.fontSize = 60
        
        smallSection.radius = 10000
        
        bottomSection.radius = 10000
        bottomSection.fontSize = 52
    }
    
    func setupTemplateInteraction() {
        self.isUserInteractionEnabled = true
        topSection.isUserInteractionEnabled = true
        smallSection.isUserInteractionEnabled = true
        middleSection.isUserInteractionEnabled = true
        bottomSection.isUserInteractionEnabled = true
    }
    
    func fill(template: LettyTemplate) {
        let lenght = 4
        guard
            let sections = template.sections,
            sections.count >= lenght
            else {
            return
        }
        
        let top = sections[0]
        topSection.text = top.text
        topSection.fontName = top.font.name
        topSection.textColor = top.color.value
        
        let small = sections[1]
        smallSection.text = small.text
        smallSection.fontName = small.font.name
        smallSection.textColor = small.color.value
        
        let middle = sections[2]
        middleSection.text = middle.text
        middleSection.fontName = middle.font.name
        middleSection.textColor = middle.color.value
        
        let bottom = sections[3]
        bottomSection.text = bottom.text
        bottomSection.fontName = bottom.font.name
        bottomSection.textColor = bottom.color.value
    }
    
}
