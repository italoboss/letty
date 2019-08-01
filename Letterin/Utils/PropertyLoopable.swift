//
//  PropertyLoopable.swift
//  Letterin
//
//  Created by Italo Boss on 01/08/19.
//  Copyright © 2019 KB. All rights reserved.
//

import Foundation

protocol PropertyLoopable {
    func allProperties() throws -> [String: Any]
    func allPropertiesValues() throws -> [Any]
}

extension PropertyLoopable {
    
    func allProperties() throws -> [String: Any] {
        
        var result: [String: Any] = [:]
        
        let mirror = Mirror(reflecting: self)
        
        guard let style = mirror.displayStyle, style == .struct || style == .class else {
            //throw some error
            throw NSError(domain: "PropertyLoopable", code: 777, userInfo: nil)
        }
        
        for (labelMaybe, valueMaybe) in mirror.children {
            guard let label = labelMaybe else {
                continue
            }
            
            result[label] = valueMaybe
        }
        
        return result
    }
    
    func allPropertiesValues() throws -> [Any] {
        
        var result: [Any] = []
        
        let mirror = Mirror(reflecting: self)
        
        guard let style = mirror.displayStyle, style == .struct || style == .class else {
            //throw some error
            throw NSError(domain: "PropertyLoopable", code: 777, userInfo: nil)
        }
        
        for (labelMaybe, valueMaybe) in mirror.children {
            guard labelMaybe != nil else {
                continue
            }
            result.append(valueMaybe)
        }
        
        return result
    }
    
}
