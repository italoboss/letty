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
    
    enum Kind: String, CaseIterable {
        case bg17
        case bg18
        case bg19
        case bg20
        case bg21
        case bg22
        case bg23
        case bg24
        case bg25
        case bg26
        case bg27
        case bg28
        case bg29
        case bg30
        case bg31
        case bg32
        case bg33
        case bg34
        case bg35
        
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
    
    static func loadAllKinds() -> [LettyBg] {
        return LettyBg.Kind.allCases.map { LettyBg(kind: $0) }
    }
    
}
