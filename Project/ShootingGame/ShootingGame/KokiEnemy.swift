//
//  KokiEnemy.swift
//  ShootingGame
//
//  Created by ggd_23 on 2014/12/04.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//

import SpriteKit
import Foundation

class KokiEnemy{
    
    var square: SKSpriteNode!
    var startPos: CGPoint!
    var beganPos: CGPoint!
    var Speedx : CGFloat = 2.0
    var Speedy : CGFloat = 7.0
    
    init(obj : SKScene){
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 40))
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMidY(obj.frame))
        
        obj.addChild(square)
        
        startPos = CGPointMake(
            square.position.x,
            square.position.y
        )
        println(startPos)
        
    }
    
    
    func update() {   /* Called evry time */
        
        square.position = CGPointMake(square.position.x+Speedx, square.position.y-Speedy)
        
        Speedy++
        Speedx++
        
        if(square.position.y > 710){
            Speedy *= -1
        }
        if(square.position.y < 320){
            Speedy *= -1
        }
        if(square.position.x > 710){
            Speedx *= -1
        }
        if(square.position.x < 320){
            Speedx *= -1
        }
        
        
    }
}