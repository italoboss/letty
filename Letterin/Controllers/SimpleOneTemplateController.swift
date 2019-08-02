//
//  SimpleOneTemplateController.swift
//  Letterin
//
//  Created by Italo Boss on 26/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

class SimpleOneTemplateController: LettyTemplateViewController {

    let template = SimpleOneTemplate()
    
    override func viewDidLoad() {
        self.templateView = template
        super.viewDidLoad()
        print("On SimpleOneTemplateController")
        setupGestures()
    }
    
    func setupGestures() {
        template.topSection.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.handleTap(gestureRecognizer:)))
        )
        template.smallSection.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.handleTap(gestureRecognizer:)))
        )
        template.middleSection.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.handleTap(gestureRecognizer:)))
        )
        template.bottomSection.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.handleTap(gestureRecognizer:)))
        )
        template.lastSection.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(self.handleTap(gestureRecognizer:)))
        )
    }
    
    @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        if let tapped = gestureRecognizer.view as? LetteringSectionView {
            let editSection = EditSectionViewController(section: tapped)
            self.present(editSection, animated: true)
        }
    }
    
}
