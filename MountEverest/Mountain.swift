//
//  Person.swift
//  Altitude
//
//  Created by Rosalyn Kingsmill on 2016-06-13.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

import Foundation
import CoreGraphics

class Mountain {
    var actualClimbedHeight = NSNumber()
    let actualMountainHeight = NSNumber(float: 8848)
    let simulatedMountainPixels = NSNumber(float: 857.9)
    var simulatedClimbedPixels: NSNumber {
        get {
            return simulatedMountainPixels.floatValue * (actualClimbedHeight.floatValue / actualMountainHeight.floatValue)
        }
    }
//    var currentBaseCamp = BaseCamp?()
//    var nextBaseCamp = BaseCamp?()
//
//    func getCurrentAndNextBaseCamp() {
//        
//        switch self.simulatedClimbedPixels.intValue {
//        case 0...100:
//            self.currentBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(5.0), y: CGFloat(613.5)), distance: 0)
//            self.nextBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//        case 100...200:
//            self.currentBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//            self.nextBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//        case 200...300:
//            self.currentBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//            self.nextBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//        case 300...400:
//            self.currentBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//            self.nextBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//        case 400...500:
//            self.currentBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//            self.nextBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//        case 500...600:
//            self.currentBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//            self.nextBaseCamp = BaseCamp(location:CGPoint(x: CGFloat(255), y: CGFloat(444.5)), distance: 100)
//        default:
//            break
//        }
  
        
    }
    
