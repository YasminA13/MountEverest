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
    let path = CGPathCreateMutable()
    
    override func didMoveToView(view: SKView) {
        //sprite setup
        sprite = SKSpriteNode(imageNamed: "Spaceship")
        sprite!.xScale = 0.2
        sprite!.yScale = 0.2
        sprite!.position = CGPointMake(frame.width/2, frame.height/2)
        self.addChild(sprite!)
        
        //create path - need to change to our mountain path
//        self.setPath()
        
        let followLine = SKAction.followPath(path, asOffset: true, orientToPath: false, duration: 3.0)
        
        sprite!.runAction(SKAction.sequence([followLine]))
        
    }
    
//    func setPath() {
//        
//        CGPathMoveToPoint(path, nil, 5.0, 613.5)
//        CGPathAddLineToPoint(path, nil, 55.5, 577.5)
//        CGPathAddLineToPoint(path, nil, 87.0, 563.5)
//        CGPathAddLineToPoint(path, nil, 106.0, 540.0)
//        CGPathAddLineToPoint(path, nil, 138.5, 527.0)
//        CGPathAddLineToPoint(path, nil, 148.5, 510.5)
//        CGPathAddLineToPoint(path, nil, 255.0, 444.5)
//        CGPathAddLineToPoint(path, nil, 278.5, 426.0)
//        CGPathAddLineToPoint(path, nil, 305.0, 418.0)
//        CGPathAddLineToPoint(path, nil, 333.0, 390.0)
//        CGPathAddLineToPoint(path, nil, 354.5, 385.0)
//        CGPathAddLineToPoint(path, nil, 373.5, 379.5)
//        CGPathAddLineToPoint(path, nil, 469.5, 351.5)
//        CGPathAddLineToPoint(path, nil, 530.0, 312.0)
//        CGPathAddLineToPoint(path, nil, 575.5, 290.0)
//        CGPathAddLineToPoint(path, nil, 638.0, 247.5)
//        CGPathAddLineToPoint(path, nil, 653.5, 223.5)
//        CGPathAddLineToPoint(path, nil, 675.5, 217.5)
//        CGPathAddLineToPoint(path, nil, 683.5, 204.5)
//        CGPathAddLineToPoint(path, nil, 710.5, 190.0)
//        CGPathAddLineToPoint(path, nil, 723.5, 181.0)
//    }
}