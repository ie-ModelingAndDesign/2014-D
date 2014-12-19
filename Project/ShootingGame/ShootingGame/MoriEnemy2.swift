//
//  enemy2.swift
//  stg
//
//  Created by inamine moriyuki on 2014/12/05.
//  Copyright (c) 2014年 inamine moriyuki. All rights reserved.
//

import Foundation
import SpriteKit

class MoriEnemy2{
    var square: SKSpriteNode!
    var startPos: CGPoint!
    var beganPos: CGPoint!
    
    
    var timer = NSTimer()
    init (obj : SKScene) {
        
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 80))
        
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMidY(obj.frame))
        
        
        
        obj.addChild(square)
        
        startPos = CGPointMake(
            square.position.x,
            square.position.y
            
            
            
        )
        
        
    }
    
    
    

    var i = 0

    func update() {
        /* Called before each frame is rendered */
        var a = Int(arc4random())%1100
        var b = Int(arc4random())%900
        var c = Int(arc4random())%600
        
        var action1 = SKAction.moveTo(CGPoint(x: a,y: c), duration: 1)
        var action2 = SKAction.moveTo(CGPoint(x: b,y: a), duration: 1)
        
        if (i>=0 || i<120){
            
            square.runAction(action1)
            
            i = i+1
        }
        
        
        if (i >= 240){
            
            square.runAction(action2)
            i =  i+1
            
            if i == 240 {
                i = 0
            }
        }
        
        
        
    }
}



        