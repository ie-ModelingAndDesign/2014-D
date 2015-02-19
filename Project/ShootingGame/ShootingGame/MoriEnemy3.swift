//
//  MoriEnemy3.swift
//  stg
//
//  Created by inamine moriyuki on 2014/12/25.
//  Copyright (c) 2014年 inamine moriyuki. All rights reserved.


//　　　右から左への動き

import Foundation
import SpriteKit

class MoriEnemy3{
    var square: SKSpriteNode!
    var startPos: CGPoint!
    var beganPos: CGPoint!
    
    var timer = NSTimer()
    init (obj : SKScene) {
        
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 80))
        
        square.position = CGPoint(x: CGRectGetMaxX(obj.frame), y: CGRectGetMidY(obj.frame))
        
        
        
        
        obj.addChild(square)
        
        startPos = CGPointMake(
            square.position.x,
            square.position.y
            
            
            
        )
        println(startPos)
        
        
    }
    
    
    func update() {
        /* Called before each frame is rendered */
        
        var action1 = SKAction.moveTo(CGPoint(x: 150,y: 400), duration: 1)
        square.runAction(action1)
    }
}
