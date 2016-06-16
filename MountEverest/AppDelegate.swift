//
//  AppDelegate.swift
//  MountEverest
//
//  Created by Yasmin Ahmad on 2016-06-13.
//  Copyright © 2016 YasminA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var floorTracker = FloorTracker()
    
    var dataManager = DataManager() {
        didSet {
            dataManager.floorTracker = self.floorTracker
        }
    }
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.dataManager.getStartDate()
        let gameViewController = window?.rootViewController as! GameViewController
        gameViewController.dataManager = self.dataManager
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        self.dataManager.saveUserDefaults()
    }

    func applicationDidBecomeActive(application: UIApplication) {
        self.dataManager.fetchDefaults()
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }



    func applicationWillTerminate(application: UIApplication) {

        
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

