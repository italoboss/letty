//
//  LettyBg.swift
//  Letterin
//
//  Created by Italo Boss on 27/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

struct LettyBg {
    
    var kind: Kind
    
    enum Kind: String {
        case bg01
        case bg02
        case bg03
        case bg04
        case bg05
        case bg06
        case bg07
        case bg08
        case bg09
        case bg10
        case bg11
        case bg12
        case bg13
        case bg14
        case bg15
        case bg16
        
        var image: UIImage? {
            return UIImage(named: self.rawValue)
        }
    }
    
}
