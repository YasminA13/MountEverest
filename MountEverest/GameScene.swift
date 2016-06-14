//
//  GameScene.swift
//  MountEverest
//
//  Created by Yasmin Ahmad on 2016-06-13.
//  Copyright (c) 2016 YasminA. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var sprite: SKSpriteNode?
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        sprite = SKSpriteNode(imageNamed: "Spaceship")
        sprite!.xScale = 0.5
        sprite!.yScale = 0.5
        sprite!.position = CGPointMake(frame.width/2, frame.height/2)
        self.addChild(sprite!)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //capture touch event
        if let touch:UITouch = touches.first {
            //get position that was touched
            
            let touchPosition = touch.locationInNode(self)
            //FOR PURPOSES OF APP CHANGE TOUCHPOSITION TO FINAL POSITION USING CGPOINT
            
            //Define action for sprite to take
            let moveAction = SKAction.moveTo(touchPosition, duration: 0.5)
            
            sprite!.runAction(moveAction)

        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
