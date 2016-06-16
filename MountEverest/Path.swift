//
//  Path.swift
//  MountEverest
//
//  Created by Rosalyn Kingsmill on 2016-06-16.
//  Copyright © 2016 YasminA. All rights reserved.
//

import Foundation

class Path {
    let basecamps = [BaseCamp]()
    var currentCamp = BaseCamp?()
    var nextCampHeight = Float()
    
    init(){
        let baseCamp0 = BaseCamp(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
        let baseCamp1 = BaseCamp(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
        let baseCamp2 = BaseCamp(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
        let baseCamp3 = BaseCamp(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
        let baseCamp4 = BaseCamp(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
        let baseCamp5 = BaseCamp(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
        
        basecamps.append(baseCamp0, baseCamp1, baseCamp2, baseCamp3, baseCamp4, baseCamp5)
        
        currentCamp = baseCamp0
    }
    
}
//initializes camp objects and put them in an array. like a camp manager
