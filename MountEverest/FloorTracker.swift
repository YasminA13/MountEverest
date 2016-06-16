//
//  AltitudeTracker.swift
//  Altitude
//
//  Created by Rosalyn Kingsmill on 2016-06-13.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

import Foundation
import CoreMotion

class FloorTracker: NSObject {
    
    let mountainHeight = NSNumber(float: 8848)
    
    
    let pedometer = CMPedometer()
    var currentHeight: NSNumber = NSNumber(float: 0.0) {
        didSet {
            if currentHeight.floatValue >= mountainHeight.floatValue {
                pedometer.stopPedometerUpdates()
                NSNotificationCenter.defaultCenter().postNotificationName("GameDidFinishNotification", object: nil)
            }
        }
    }
    
    var lastLoginDate: NSDate?
    
    var lastSavedHeight: NSNumber? {
        didSet {
            self.pedometerDidUpdate()
        }
    }
 
    func pedometerDidUpdate() {
        pedometer.startPedometerUpdatesFromDate(lastLoginDate!) { (data: CMPedometerData?, error: NSError?) in
            
            guard CMPedometer.isFloorCountingAvailable() else {
                print("No Floor counting, sorry")
                return
            }
            guard error == nil else {
                print("error", error?.localizedDescription)
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            let floorsAscended = data.floorsAscended
            self.currentHeight = floorsAscended!.floatValue + self.lastSavedHeight!.floatValue
            print("current height", self.currentHeight)
        }
    }
    
}