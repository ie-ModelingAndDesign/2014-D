//
//  enemy.swift
//  stg
//
//  Created by inamine moriyuki on 2014/11/27.
//  Copyright (c) 2014年 inamine moriyuki. All rights reserved.
//

import Foundation
import SpriteKit

class MoriEnemy : Enemy{
    var square: SKSpriteNode!
    var startPos: CGPoint!
    var beganPos: CGPoint!
    
    var height : CGFloat!
    var timer = NSTimer()
    override init (obj : SKScene) {
        super.init(obj: obj);
        myscene = obj
        
        height = ScreenManager.getInstance().getRandomY()/2+ScreenManager.getInstance().getBottom()+250
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(10, 80))        
        square.position = CGPoint(x: ScreenManager.getInstance().getRandomX(), y: ScreenManager.getInstance().getTop()+50)
        square.alpha = 0    // 非表示
        
        
        obj.addChild(square)
        
        startPos = CGPointMake(
            square.position.x,
            square.position.y
            
            
            
        )
        
        
    }
    
    
    
    var i = 0
    
    override func update() {
        super.update();
        /* Called before each frame is rendered */
        
       
        
        //var action1 = SKAction.rotateByAngle(CGFloat(90 * M_PI / 1000), duration: 2 )
        var action2 = SKAction.moveTo(CGPoint(x: 700,y: height), duration: 2)
        var action3 = SKAction.moveTo(CGPoint(x: 150,y: height), duration: 2)
        
        var actionX = SKAction.group([action2])
        var actionY = SKAction.group([action3])
        
        if(square != nil){
            angle += 20     // 回転
            if (i>=0 || i<121){
                
                square.runAction(actionX)
                i = i+1
                
                
            }
            
            
            if (i >= 121){
                square.runAction(actionY)
                i =  i+1
                
                if i == 240 {
                    i = 0
                }
            }
            position = square.position
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


