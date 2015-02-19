//
//  MoriEnemy9.swift
//  stg
//
//  Created by inamine moriyuki on 2015/01/16.
//  Copyright (c) 2015年 inamine moriyuki. All rights reserved.

//　　　　よくわからない動き


import Foundation
import SpriteKit

class MoriEnemy9 : Enemy{
    var square: SKSpriteNode!
    
    
    var centerPos: CGPoint!
    
    
    
    var timer = NSTimer()
    override init (obj : SKScene) {
        super.init(obj: obj);
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 40))
        
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMidY(obj.frame))
        
        
        
        obj.addChild(square)
        
        centerPos = CGPointMake(
            square.position.x,
            square.position.y
            
            
            
        )
        println(centerPos)
        
        
    }
    
    
    var rot = 0.0 //角度
    var i = 0  //時間
    
    override func update() {
        super.update()
        var angle = 0.9
        
        rot += angle;
        
        //角度
        let rad =  rot * M_PI / 80
        
        var action1 = SKAction.moveTo(CGPoint(x: 512 + 5*cos(rad)*50,y: 384 + 5*sin(rad)*90), duration: 1)
        var action2 = SKAction.moveTo(CGPoint(x: 512 + 5*sin(rad)*50,y: 384 + 5*cos(rad)*90), duration: 1)
        
        if(square != nil){
            position = square.position
            if (i >= 0 || i < 60){
            
            
          
                square.runAction(action1)
                i++;
            
            }
        
            if (i >= 60 ){
            
                square.runAction(action2)
                        
                if (i == 120){
                
                    i = 0

            
                }
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