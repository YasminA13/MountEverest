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
    
    var dataManager: DataManager!
    let mountain = Mountain()
    
    var reachNextBaseCamp = Bool(false)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameViewController.didFinishGame), name: "GameViewController", object: nil)
    }
    
    @objc private func didFinishGame() {
        self.showWinningState()
    }

    private func showWinningState() {
        // show some confetti
        print(#function)
        self.restartGame()
    }
    
    private func restartGame() {
        // call this after a delay
        dataManager.restartGame()
    }
    
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
        }
        
        func viewDidAppear() {
            super.viewDidAppear(true)
            
            self.reachNextBaseCamp = self.checkForNextBaseCamp(self.mountain.currentBaseCamp!, nextBaseCamp: self.mountain.nextBaseCamp!)
        }
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func checkForNextBaseCamp(currentBaseCamp:BaseCamp, nextBaseCamp:BaseCamp)-> Bool {
        return (self.mountain.actualClimbedHeight == nextBaseCamp.distance)
    }
    
 }
