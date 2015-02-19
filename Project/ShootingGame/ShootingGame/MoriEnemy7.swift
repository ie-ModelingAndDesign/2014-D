//
//  MoriEnemy7.swift
//  stg
//
//  Created by inamine moriyuki on 2015/01/16.
//  Copyright (c) 2015年 inamine moriyuki. All rights reserved.


//        だ円運動


import Foundation
import SpriteKit

class MoriEnemy7{
    var square: SKSpriteNode!
    
    
    var centerPos: CGPoint!
    
    
    
    var timer = NSTimer()
    init (obj : SKScene) {
        
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 80))
        
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMidY(obj.frame))
        
        
        
        obj.addChild(square)
        
        centerPos = CGPointMake(
            square.position.x,
            square.position.y
            
            
            
        )
        println(centerPos)
        
        
    }
    
    
    var rot = 0.0 //角度
    
    
    func update() {
        
        var angle = 0.9
        
        
        rot += angle;
        
        //角度
        let rad =  rot * M_PI / 50
        
        //だ円運動の計算
        square.position.x = square.position.x + CGFloat(5*cos(rad)) * 2
        square.position.y = square.position.y + CGFloat(5*sin(rad)) * 1
        
    }
    
    
}
        