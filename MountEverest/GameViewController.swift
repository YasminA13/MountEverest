 //
//  GameViewController.swift
//  MountEverest
//
//  Created by Yasmin Ahmad on 2016-06-13.
//  Copyright (c) 2016 YasminA. All rights reserved.
//

import UIKit
import SpriteKit
import CoreGraphics

class GameViewController: UIViewController {
    var floorTracker = FloorTracker()
    var reachNextBaseCamp = Bool(false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
            
            floorTracker.updateFloorsFromLastLogin()
        }
        
        func viewDidAppear() {
            super.viewDidAppear(true)
            
            self.reachNextBaseCamp = self.checkForNextBaseCamp(floorTracker.person.currentBaseCamp!, nextBaseCamp: floorTracker.person.nextBaseCamp!)
        }
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func checkForNextBaseCamp(currentBaseCamp:BaseCamp, nextBaseCamp:BaseCamp)-> Bool {
        return (floorTracker.person.actualClimbedHeight == nextBaseCamp.distance)
        
    }
    
 }
