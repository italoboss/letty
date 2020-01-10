//
//  AppConfig.swift
//  Letterin
//
//  Created by Italo Boss on 09/01/20.
//  Copyright © 2020 KB. All rights reserved.
//

import Foundation

class AppConfig {
    
    static var LOCAL_IMAGES_PATH: String {
        var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        path.appendPathComponent("covers")
        return path.path
    }
    
}
