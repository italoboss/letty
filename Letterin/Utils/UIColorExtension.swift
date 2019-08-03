//
//  UIColorExtension.swift
//  Letterin
//
//  Created by Italo Boss on 02/08/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

extension UIColor {
    
    var isLight: Bool {
        var white : CGFloat = 0
        self.getWhite(&white, alpha: nil)
        return white > 0.8
    }
    
}
