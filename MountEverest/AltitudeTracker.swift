//
//  AltitudeTracker.swift
//  Altitude
//
//  Created by Rosalyn Kingsmill on 2016-06-13.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

import Foundation
import CoreMotion

class AltitudeTracker: NSObject {
    
    let altimeter = CMAltimeter()
    var person = Person()
    var lastPoint = NSNumber(float: 0.0)
    
    
    func relativeAltitude() {
    
    if (CMAltimeter.isRelativeAltitudeAvailable()) {
    
        altimeter.startRelativeAltitudeUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { data, error in
    
    if (error == nil) {
        
        print("Relative Altitude: \(data!.relativeAltitude)")
        print("Pressure: \(data!.pressure)")
        var difference = NSNumber()
        difference = data!.relativeAltitude.floatValue - self.lastPoint.floatValue
        if (difference.floatValue > 0) {
            self.person.mountainHeight = self.person.mountainHeight.floatValue + difference.floatValue
        }
        
        self.lastPoint = data!.relativeAltitude
        print(self.person.mountainHeight)
    
    }
    
    })
    }
    }
    
}


