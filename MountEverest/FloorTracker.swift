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
    
    let floor = CMAltimeter()
    var person = Person()
    var lastPoint = NSNumber(float: 0.0)
    let pedometer = CMPedometer()
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func recordCurrentFloors() {
        
        if CMPedometer.isFloorCountingAvailable(){
            pedometer.startPedometerUpdatesFromDate(NSDate(),
                                                    withHandler: {data, error in
                                                        dispatch_async(dispatch_get_main_queue(), {
                                                            
                                                            guard let data = data else{
                                                                print("No data")
                                                                return
                                                            }
                                                            print ("Steps:", data.numberOfSteps)
                                                            print("Floors ascended:", data.floorsAscended!)
                                                            print("Floors descended:", data.floorsAscended!)
                                                            
                                                            //update mountain height with current meters
                                                            self.person.mountainHeight = self.person.mountainHeight.floatValue + (data.floorsAscended!.floatValue * 4.7)
                                                            
                                                            print("Cumulative floors:", self.person.mountainHeight)
                                                            
                                                            //save latest NSDefault values for next login
                                                            self.updateUserDefaults()
                                                            
                                                        })
                                                        
            })
            
        } else {
            print("Floor counting is not available")
        }
        
    }
    
    func updateFloorsFromLastLogin() {
        
        let lastDate = self.defaults.objectForKey("LastDate") as! NSDate
        pedometer.queryPedometerDataFromDate(lastDate,
                                             toDate: NSDate()){(data: CMPedometerData?, error: NSError?) -> Void in
                                                guard let data = data else{
                                                    print("No new data")
                                                    return
                                                }
                                                self.person.mountainHeight = self.person.mountainHeight.floatValue + (data.floorsAscended!.floatValue * 4.7)
                                                
                                                //save latest NSDefault values
                                                self.updateUserDefaults()
                                                //start recording new flights of stairs
                                                self.recordCurrentFloors()
        }
    }
    
    func getStartDate() {
            
            if (self.defaults.objectForKey("StartDate") == nil) {
                self.defaults.setObject(NSDate(), forKey: "StartDate")
            } else {
                print("Welcome Back")
                return
            }
    }
    
    func updateUserDefaults() {
        //save latest NSDefault values for next login
        self.defaults.setFloat(self.person.mountainHeight.floatValue, forKey: "Height")
        self.defaults.setObject(NSDate(), forKey: "LastDate")
    }
    
}