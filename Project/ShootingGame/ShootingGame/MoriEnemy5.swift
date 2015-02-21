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
    
    var action1 : SKAction!
    var timer = NSTimer()
    override init (obj : SKScene) {
        super.init(obj: obj);
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 80))
        
        var spawnx = ScreenManager.getInstance().getRandomX()
        square.position = CGPoint(x: spawnx, y: CGRectGetMaxY(obj.frame))
        square.alpha = 0    // 非表示
        
        obj.addChild(square)
        
        startPos = CGPointMake(
            square.position.x,
            square.position.y
        )
        action1 = SKAction.moveTo(CGPoint(x: spawnx,y: -100), duration: 3)
        square.runAction(action1)
    }
    
    
    override func update() {
        super.update()
        /* Called before each frame is rendered */
        if(square != nil){
            position = square.position
            if(position.y < ScreenManager.getInstance().getBottom()-60){
                Destroy(false)
            }
        }
    }
    
    override func Destroy(point : Bool){
        if(square != nil){
            myscene.removeChildrenInArray([square])
        }
        square = nil
        super.Destroy(point)
    }
    

}
