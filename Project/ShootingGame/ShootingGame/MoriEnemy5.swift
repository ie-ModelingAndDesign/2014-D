//
//  MoriEnemy5.swift
//  stg
//
//  Created by inamine moriyuki on 2014/12/25.
//  Copyright (c) 2014年 inamine moriyuki. All rights reserved.


//     上から下への動き

import Foundation
import SpriteKit

class MoriEnemy5{
    var square: SKSpriteNode!
    var startPos: CGPoint!
    var beganPos: CGPoint!
    
       var timer = NSTimer()
    init (obj : SKScene) {
        
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 80))
        
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMaxY(obj.frame))
        
        
        
               
        obj.addChild(square)
        
        startPos = CGPointMake(
            square.position.x,
            square.position.y
            
            
            
        )
        println(startPos)
        
        
    }
    
    
    func update() {
        /* Called before each frame is rendered */
        
        var action1 = SKAction.moveTo(CGPoint(x: 530,y: -100), duration: 1)
        square.runAction(action1)
    }
}
