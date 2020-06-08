//
//  Colors.swift
//  Letterin
//
//  Created by Italo Boss on 26/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

enum Colors: Int, CaseIterable {
    
    case primary
    
    case yellowIris
    case lettuceGreen
    case blueSurf
    case bougainvillea
    case hotPink
    case coffee
    case kale
    case niagara
    
    case serenity
    case lavender
    case pinkIcing
    case dogwood
    case gardenia
    case citron
    case island
    case puritan
    
    case ultraViolet
    case radiant
    case fuchsia
    case coral
    case sunset
    case greenery
    case paradise
    case greyBlue
    
    case lapis
    case mediumPurple
    case peacock
    case cheddar
    case postIt
    case lime
    case marina
    case darkBlue
    
    case deepBlue
    case blossom
    case vivacious
    case papaya
    case vibrant
    case forest
    case ocean
    case darkGrey
    
    case coconut
    case marsala
    case clay
    case wood
    case rose
    case roseWhite
    case greyWhite
    case white
    
}

extension Colors {
    
    var value: UIColor {
        switch self {
        case .primary: return UIColor(displayP3Red: 235/255, green: 136/255, blue: 117/255, alpha: 1.0)
            
        case .yellowIris: return UIColor(displayP3Red: 235/255, green: 211/255, blue: 117/255, alpha: 1.0)
        case .lettuceGreen: return UIColor(displayP3Red: 117/255, green: 235/255, blue: 172/255, alpha: 1.0)
        case .blueSurf: return UIColor(displayP3Red: 117/255, green: 160/255, blue: 235/255, alpha: 1.0)
        case .bougainvillea: return UIColor(displayP3Red: 192/255, green: 117/255, blue: 235/255, alpha: 1.0)
        case .hotPink: return UIColor(displayP3Red: 235/255, green: 117/255, blue: 145/255, alpha: 1.0)
        case .coffee: return UIColor(displayP3Red: 135/255, green: 70/255, blue: 58/255, alpha: 1.0)
        case .kale: return UIColor(displayP3Red: 85/255, green: 135/255, blue: 58/255, alpha: 1.0)
        case .niagara: return UIColor(displayP3Red: 58/255, green: 131/255, blue: 135/255, alpha: 1.0)
            
        case .serenity: return UIColor(displayP3Red: 197/255, green: 201/255, blue: 234/255, alpha: 1.0)
        case .lavender: return UIColor(displayP3Red: 226/255, green: 189/255, blue: 232/255, alpha: 1.0)
        case .pinkIcing: return UIColor(displayP3Red: 250/255, green: 186/255, blue: 208/255, alpha: 1.0)
        case .dogwood: return UIColor(displayP3Red: 255/255, green: 204/255, blue: 186/255, alpha: 1.0)
        case .gardenia: return UIColor(displayP3Red: 255/255, green: 250/255, blue: 193/255, alpha: 1.0)
        case .citron: return UIColor(displayP3Red: 220/255, green: 238/255, blue: 198/255, alpha: 1.0)
        case .island: return UIColor(displayP3Red: 177/255, green: 229/255, blue: 253/255, alpha: 1.0)
        case .puritan: return UIColor(displayP3Red: 143/255, green: 164/255, blue: 175/255, alpha: 1.0)
            
        case .ultraViolet: return UIColor(displayP3Red: 120/255, green: 132/255, blue: 205/255, alpha: 1.0)
        case .radiant: return UIColor(displayP3Red: 187/255, green: 101/255, blue: 202/255, alpha: 1.0)
        case .fuchsia: return UIColor(displayP3Red: 242/255, green: 96/255, blue: 145/255, alpha: 1.0)
        case .coral: return UIColor(displayP3Red: 255/255, green: 138/255, blue: 96/255, alpha: 1.0)
        case .sunset: return UIColor(displayP3Red: 255/255, green: 243/255, blue: 108/255, alpha: 1.0)
        case .greenery: return UIColor(displayP3Red: 173/255, green: 214/255, blue: 125/255, alpha: 1.0)
        case .paradise: return UIColor(displayP3Red: 72/255, green: 194/255, blue: 249/255, alpha: 1.0)
        case .greyBlue: return UIColor(displayP3Red: 143/255, green: 164/255, blue: 175/255, alpha: 1.0)
            
        case .lapis: return UIColor(displayP3Red: 62/255, green: 78/255, blue: 184/255, alpha: 1.0)
        case .mediumPurple: return UIColor(displayP3Red: 157/255, green: 27/255, blue: 178/255, alpha: 1.0)
        case .peacock: return UIColor(displayP3Red: 237/255, green: 21/255, blue: 97/255, alpha: 1.0)
        case .cheddar: return UIColor(displayP3Red: 255/255, green: 86/255, blue: 7/255, alpha: 1.0)
        case .postIt: return UIColor(displayP3Red: 255/255, green: 237/255, blue: 24/255, alpha: 1.0)
        case .lime: return UIColor(displayP3Red: 137/255, green: 197/255, blue: 64/255, alpha: 1.0)
        case .marina: return UIColor(displayP3Red: 0, green: 167/255, blue: 247/255, alpha: 1.0)
        case .darkBlue: return UIColor(displayP3Red: 95/255, green: 125/255, blue: 140/255, alpha: 1.0)
            
        case .deepBlue: return UIColor(displayP3Red: 48/255, green: 57/255, blue: 161/255, alpha: 1.0)
        case .blossom: return UIColor(displayP3Red: 124/255, green: 19/255, blue: 164/255, alpha: 1.0)
        case .vivacious: return UIColor(displayP3Red: 196/255, green: 16/255, blue: 90/255, alpha: 1.0)
        case .papaya: return UIColor(displayP3Red: 230/255, green: 73/255, blue: 2/255, alpha: 1.0)
        case .vibrant: return UIColor(displayP3Red: 252/255, green: 193/255, blue: 1/255, alpha: 1.0)
        case .forest: return UIColor(displayP3Red: 102/255, green: 160/255, blue: 48/255, alpha: 1.0)
        case .ocean: return UIColor(displayP3Red: 0, green: 135, blue: 212/255, alpha: 1.0)
        case .darkGrey: return UIColor(displayP3Red: 41/255, green: 49/255, blue: 56/255, alpha: 1.0)
            
        case .coconut: return UIColor(displayP3Red: 88/255, green: 31/255, blue: 5/255, alpha: 1.0)
        case .marsala: return UIColor(displayP3Red: 156/255, green: 54/255, blue: 8/255, alpha: 1.0)
        case .clay: return UIColor(displayP3Red: 195/255, green: 116/255, blue: 80/255, alpha: 1.0)
        case .wood: return UIColor(displayP3Red: 205/255, green: 168/255, blue: 152/255, alpha: 1.0)
        case .rose: return UIColor(displayP3Red: 255/255, green: 212/255, blue: 192/255, alpha: 1.0)
        case .roseWhite: return UIColor(displayP3Red: 255/255, green: 244/255, blue: 239/255, alpha: 1.0)
        case .greyWhite: return UIColor(displayP3Red: 255/255, green: 248/255, blue: 245/255, alpha: 1.0)
        case .white: return UIColor(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        }
    }
    
    static func caseFromValue(_ value: UIColor?) -> Colors {
        for c in Colors.allCases where c.value == value {
            return c
        }
        return primary
    }
    
}
