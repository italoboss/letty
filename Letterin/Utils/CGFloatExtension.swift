//
//  CGFloat.swift
//  Letterin
//
//  Created by Italo Boss on 26/07/19.
//  Copyright © 2019 KB. All rights reserved.
//

import UIKit

extension CGFloat {
    
    /** Radians to Degrees **/
    var degrees: CGFloat {
        return self * (180.0 / .pi)
    }
    
    /** Degrees to Radian **/
    var radians: CGFloat {
        return self / 180.0 * .pi
    }
}
