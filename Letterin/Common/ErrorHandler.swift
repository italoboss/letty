//
//  ErrorHandler.swift
//  Letterin
//
//  Created by Italo Boss on 08/01/20.
//  Copyright © 2020 KB. All rights reserved.
//

import Foundation

class ErrorHandler {
    
    static let shared = ErrorHandler()
    
    func consoleLogError(_ error: NSError) {
        print("Unresolved error \(error), \(error.userInfo)")
    }

}
