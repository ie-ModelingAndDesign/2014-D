//
//  MoriEnemy3.swift
//  stg
//
//  Created by inamine moriyuki on 2014/12/25.
//  Copyright (c) 2014年 inamine moriyuki. All rights reserved.


//　　　右から左への動き

import Foundation
import SpriteKit

class MoriEnemy3 : Enemy{
    var square: SKSpriteNode!
    var startPos: CGPoint!
    var beganPos: CGPoint!
    
    var timer = NSTimer()
    var randomY : CGFloat!
    override init (obj : SKScene) {
        super.init(obj: obj);
        myscene = obj

        square =  SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 80))

        randomY = ScreenManager.getInstance().getRandomY()
        square.position = CGPoint(x: CGRectGetMaxX(obj.frame), y: randomY)
        
        
        
        
        obj.addChild(square)
        
        startPos = CGPointMake(
            square.position.x,
            square.position.y
            
            
            
        )
        println(startPos)
        
        
    }
    
    var i = 0
    override func update() {
        super.update()
        /* Called before each frame is rendered */
        if(square != nil){
            
            var action0 = SKAction.moveTo(CGPoint(x: 650,y: randomY),duration: 2)
            var action1 = SKAction.moveTo(CGPoint(x: -200,y: randomY),duration: 1)
            
            if (i>=0 || i<121){
                
                square.runAction(action0)
                i = i+1
            }
            
            if (i >= 121 ){
                
                square.runAction(action1)
                i =  i+1
                
                if (i >= 240){

                        i = 0
            
                }
            }
            position = square.position
            if(position.x < ScreenManager.getInstance().getLeft()){
                Destroy()
            }

            
            
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
