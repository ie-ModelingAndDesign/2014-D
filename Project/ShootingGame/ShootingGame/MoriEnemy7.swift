//
//  MoriEnemy7.swift
//  stg
//
//  Created by inamine moriyuki on 2015/01/16.
//  Copyright (c) 2015年 inamine moriyuki. All rights reserved.


//        だ円運動


import Foundation
import SpriteKit

class MoriEnemy7 : Enemy{
    var square: SKSpriteNode!
    
    
    var centerPos: CGPoint!
    
    
    
    var timer = NSTimer()
    override init (obj : SKScene) {
        super.init(obj: obj);
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 80))
        
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMidY(obj.frame))
        square.alpha = 0    // 非表示
        
        
        obj.addChild(square)
        
        centerPos = CGPointMake(
            square.position.x,
            square.position.y
            
            
            
        )
        println(centerPos)
        
        
    }
    
    
    var rot = 0.0 //角度
    
    
    override func update() {
        super.update()
        var angle = 0.9
        
        
        rot += angle;
        
        //角度
        let rad =  rot * M_PI / 50
        
        if(square != nil){
            position = square.position
        //だ円運動の計算
            square.position.x = square.position.x + CGFloat(5*cos(rad)) * 2
            square.position.y = square.position.y + CGFloat(5*sin(rad)) * 1
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
        