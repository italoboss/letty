//
//  Fonts.swift
//  Letterin
//
//  Created by Italo Boss on 26/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

enum Fonts: CaseIterable {
    
    case abrilRegular
    
    case alluraRegular
    
    case bebasNeueBold
    case bebasNeueBook
    case bebasNeueLight
    case bebasNeueRegular
    case bebasNeueThin
    
    case caviarDreamsRegular
//    case caviarDreamsBold
//    case caviarDreamsBoldItalic
//    case caviarDreamsItalic
    
//    case dacingScript
    
    case geometria
    
    case intro
    case introBaseLine
    case introBase
    
    case kaushan
    
//    case learningBold
//    case learningDashed
//    case learningRegular
//
//    case lobster
//    
//    case nexaRustHand
//    case nexaRustSans
//    case nexaRustScript
//    case nexaRustShadow
    
    case pacifico
    
    case playfairDisplayBlack
    case playfairDisplayBlackItalic
    case playfairDisplayBold
    case playfairDisplayBoldItalic
    case playfairDisplayItalic
    case playfairDisplayRegular
    case playfairDisplaySCBlack
    case playfairDisplaySCBlackItalic
    case playfairDisplaySCBold
    case playfairDisplaySCBoldItalic
    case playfairDisplaySCItalic
    case playfairDisplaySCRegular
    
    case rifficBold
    
    case sofia
}

extension Fonts {
    
    var name: String {
        switch self {
        case .abrilRegular: return "AbrilFatface-Regular"
        case .alluraRegular: return "Allura-Regular"
        
        case .bebasNeueBold: return "BebasNeue-Bold"
        case .bebasNeueBook: return "BebasNeue-Book"
        case .bebasNeueLight: return "BebasNeue-Light"
        case .bebasNeueRegular: return "BebasNeue-Regular"
        case .bebasNeueThin: return "BebasNeue-Thin"
            
        case .caviarDreamsRegular: return "CaviarDreams"
//        case .caviarDreamsBold: return "Caviar_Dreams_Bold"
//        case .caviarDreamsBoldItalic: return "CaviarDreams_BoldItalic"
//        case .caviarDreamsItalic: return "CaviarDreams_Italic"
            
//        case .dacingScript: return "DancingScript-Regular"
            
        case .geometria: return "geometria-light"
            
        case .intro: return "introheadr-base"
        case .introBaseLine: return "introrustg-base2line"
        case .introBase: return "introscriptr-h2base"
            
        case .kaushan: return "KaushanScript-Regular"
            
//        case .learningBold: return "learning_curve_bold_ot_ps"
//        case .learningDashed: return "learning_curve_dashed_ot_ps"
//        case .learningRegular: return "learning_curve_regular_ot_ps"
            
//        case .lobster: return "Lobster"
            
//        case .nexaRustHand: return "NexaRustHandmade-Extended-Free"
//        case .nexaRustSans: return "NexaRustSans-Black-Free"
//        case .nexaRustScript: return "NexaRustScriptL-0-Free"
//        case .nexaRustShadow: return "NexaRustSlab-BlackShadow01-Free"
            
        case .pacifico: return "Pacifico"
            
        case .playfairDisplayBlack: return "PlayfairDisplay-Black"
        case .playfairDisplayBlackItalic: return "PlayfairDisplay-BlackItalic"
        case .playfairDisplayBold: return "PlayfairDisplay-Bold"
        case .playfairDisplayBoldItalic: return "PlayfairDisplay-BoldItalic"
        case .playfairDisplayItalic: return "PlayfairDisplay-Italic"
        case .playfairDisplayRegular: return "PlayfairDisplay-Regular"
        case .playfairDisplaySCBlack: return "PlayfairDisplaySC-Black"
        case .playfairDisplaySCBlackItalic: return "PlayfairDisplaySC-BlackItalic"
        case .playfairDisplaySCBold: return "PlayfairDisplaySC-Bold"
        case .playfairDisplaySCBoldItalic: return "PlayfairDisplaySC-BoldItalic"
        case .playfairDisplaySCItalic: return "PlayfairDisplaySC-Italic"
        case .playfairDisplaySCRegular: return "PlayfairDisplaySC-Regular"
            
        case .rifficBold: return "riffic-bold"
            
        case .sofia: return "Sofia-Regular"
        }
    }
    
    var fontToCell: UIFont? {
        return UIFont(name: self.name, size: 18)
    }
    
    func withSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: self.name, size: size)!
    }
    
}
