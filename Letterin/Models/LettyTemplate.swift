//
//  LettyTemplate.swift
//  Letterin
//
//  Created by Italo Boss on 26/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

struct LettyTemplate {
    
    var coverImage: UIImage?
    var kind: Kind
    
    enum Kind: String {
        case basicOne
        case simpleOne
        case centerCurvedOne
        case centerCurvedTwo
        case circleOne
        
        var classType: UIImageView.Type {
            switch self {
            case .basicOne: return BasicOneTemplate.self
            case .simpleOne: return SimpleOneTemplate.self
            case .centerCurvedOne: return CenterCurvedOneTemplate.self
            case .centerCurvedTwo: return CenterCurvedTwoTemplate.self
            case .circleOne: return CircleOneTemplate.self
            }
        }
    }
    
    func loadByGallery() -> [LettyTemplate] {
        let letties: [Letty] = CoreDataManager.shared.fecth() ?? []
        
        let result = letties.map { letty -> LettyTemplate in
            return LettyTemplate(coverImage: nil, kind: Kind(rawValue: "") ?? .basicOne)
        }
        
        return []
    }
    
}
