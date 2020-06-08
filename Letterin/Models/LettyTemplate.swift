//
//  LettyTemplate.swift
//  Letterin
//
//  Created by Italo Boss on 26/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

struct LettySection {
    
    var text: String?
    var color: Colors
    var font: Fonts
    
}

struct LettyTemplate {
    
    var createdAt: Date?
    var coverImage: UIImage?
    var kind: Kind
    var backgroud: LettyBg?
    
    var sections: [LettySection]?
    
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
    
    func saveAtGallery() -> Bool {
        let letty: Letty =
            CoreDataManager.shared.fetchObject(by: self.createdAt) ??
            CoreDataManager.shared.initManagedObject()
        letty.kind = self.kind.rawValue
        letty.createdAt = self.createdAt ?? Date()
        letty.background = self.backgroud?.kind.rawValue
        
        if let cover = self.coverImage {
            var path = AppConfig.LOCAL_IMAGES_PATH
            let fileName = "\(self.kind.rawValue)_\(Date().description)"
            path.append(contentsOf: fileName)
            if FileManager.default.createFile(atPath: path, contents: cover.jpegData(compressionQuality: 1.0), attributes: [:]) {
                letty.coverPath = fileName
            }
        }
        
        if let sections = self.sections {
            letty.sections = NSOrderedSet(array: sections.compactMap { section -> Section? in
                let result: Section = CoreDataManager.shared.initManagedObject()
                result.text = section.text
                result.color = Int64(section.color.rawValue)
                result.font = Int64(section.font.rawValue)
                return result
            })
        }
        
        return CoreDataManager.shared.saveContext()
    }
    
    static func loadAllAtGallery() -> [LettyTemplate] {
        let letties: [Letty] = CoreDataManager.shared.fecth() ?? []
        
        let result = letties.map { letty -> LettyTemplate in
            var bg: LettyBg? = nil
            if let background = letty.background {
               bg = LettyBg(kind: LettyBg.Kind(rawValue: background) ?? .bg17)
            }
            
            var cover: UIImage? = nil
            if let coverPath = letty.coverPath {
                var path = AppConfig.LOCAL_IMAGES_PATH
                path.append(coverPath)
                cover = UIImage(contentsOfFile: path)
            }
            
            let sections = letty.sections?.compactMap { sec -> LettySection? in
                guard let section = sec as? Section else { return nil }
                return LettySection(text: section.text ?? "", color: Colors(rawValue: Int(section.color)) ?? .primary, font: Fonts(rawValue: Int(section.font)) ?? .abrilRegular)
            }
            
            return LettyTemplate(
                createdAt: letty.createdAt,
                coverImage: cover,
                kind: Kind(rawValue: letty.kind!) ?? .basicOne,
                backgroud: bg,
                sections: sections
            )
        }
        
        return result
    }
    
}

struct LettyTemplateFactory {
    
    static func makeAll() -> [LettyTemplate] {
        return [
            LettyTemplate(
                coverImage: UIImage(named: "model6"),
                kind: .basicOne
            ),
            LettyTemplate(coverImage: UIImage(named: "model5"), kind: .simpleOne),
            LettyTemplate(coverImage: UIImage(named: "model2"), kind: .centerCurvedOne),
            LettyTemplate(coverImage: UIImage(named: "model1"), kind: .centerCurvedTwo),
            LettyTemplate(coverImage: UIImage(named: "model3"), kind: .circleOne)
        ]
    }
    
}
