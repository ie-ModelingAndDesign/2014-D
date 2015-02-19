//
//  MoriEnemy5.swift
//  stg
//
//  Created by inamine moriyuki on 2014/12/25.
//  Copyright (c) 2014年 inamine moriyuki. All rights reserved.


//     上から下への動き

import Foundation
import SpriteKit

class MoriEnemy5 : Enemy{
    var square: SKSpriteNode!
    var startPos: CGPoint!
    var beganPos: CGPoint!
    
       var timer = NSTimer()
    override init (obj : SKScene) {
        super.init(obj: obj);
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 80))
        
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMaxY(obj.frame))
        
        
        obj.addChild(square)
        
        startPos = CGPointMake(
            square.position.x,
            square.position.y
        )
        println(startPos)
        
    }
    
    
    override func update() {
        super.update()
        /* Called before each frame is rendered */
        if(square != nil){
            position = square.position
        var action1 = SKAction.moveTo(CGPoint(x: 530,y: -100), duration: 1)
        square.runAction(action1)
        }
    }
    
    override func Destroy(){
        if(square != nil){
            myscene.removeChildrenInArray([square])
        }
        square = nil
        super.Destroy()
    }
    

}
