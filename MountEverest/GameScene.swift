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
        //sprite setup
        sprite = SKSpriteNode(imageNamed: "Spaceship")
        sprite!.xScale = 0.2
        sprite!.yScale = 0.2
        sprite!.position = CGPointMake(frame.width/2, frame.height/2)
        self.addChild(sprite!)
        
        //create path - need to change to our mountain path
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, 0)
        CGPathAddLineToPoint(path, nil, 50, 100)
        let followLine = SKAction.followPath(path, asOffset: true, orientToPath: false, duration: 3.0)
        
//        let reversedLine = followLine.reversedAction()
//        let square = UIBezierPath(rect: CGRectMake(0, 0, 100, 100))
//        let followSquare = SKAction.followPath(square.CGPath, asOffset: true, orientToPath: false, duration: 5.0)
//        let circle = UIBezierPath(roundedRect: CGRectMake(0, 0, 100, 100), cornerRadius: 100)
//        let followCircle = SKAction.followPath(circle.CGPath, asOffset: true, orientToPath: false, duration: 5.0)
        
        sprite!.runAction(SKAction.sequence([followLine]))
    }
    


}