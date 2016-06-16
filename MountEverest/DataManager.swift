//
//  DataManager.swift
//  MountEverest
//
//  Created by steve on 2016-06-15.
//  Copyright © 2016 YasminA. All rights reserved.
//

import Foundation

class DataManager: NSObject {
    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    var floorTracker:FloorTracker!
    
    func saveUserDefaults() {
        self.defaults.setValue(NSDate(), forKey: "LastDate")
        print("current height before saving", self.floorTracker.currentHeight)
        self.defaults.setValue(self.floorTracker.currentHeight, forKey: "Height")
    }
    
    func fetchDefaults() {
        let lastLogoutDate = defaults.valueForKey("LastDate") as? NSDate ?? NSDate()
        let lastSavedHeight = self.defaults.valueForKey("Height") as? NSNumber ?? NSNumber(float:0.0)
        print("last logout", lastLogoutDate)
        print("last saved", lastSavedHeight)
        self.floorTracker.lastLoginDate = lastLogoutDate
        self.floorTracker.lastSavedHeight = lastSavedHeight
    }
    
    func getStartDate() {
        guard let startDate = self.defaults.objectForKey("StartDate") else {
            print("initial startdate set")
            self.defaults.setObject(NSDate(), forKey: "StartDate")
            return
        }
        print("start Date already set as:", startDate)
    }

    func restartGame() {
        self.defaults.setValue(NSNumber(float:0.0), forKey: "Height")
        self.floorTracker.currentHeight = 0
        self.resetStartDate()
    }
    
    func resetStartDate() {
        self.defaults.setValue(NSDate(), forKey: "StartDate")
    }
    
}
