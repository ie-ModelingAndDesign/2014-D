//
//  DaikiEnemy.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/11/27.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class DaikiEnemy{
    var square: SKSpriteNode!
    var centerPos: CGPoint!
    var moveTime = 0.0
    var waveSpeed = 0.01
    var waveDistance = 200.0
    var moveSpeed: CGPoint = CGPoint(x:0.0,y:-1.0)
    
    init(obj : SKScene){
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 40))
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMaxY(obj.frame))
        
        obj.addChild(square)
        
        centerPos = CGPointMake(
            square.position.x,
            square.position.y
        )
    }
    
    // called every time
    func update(){
        moveTime += waveSpeed
        centerPos = CGPointMake(centerPos.x+moveSpeed.x, centerPos.y+moveSpeed.y)
        var pos = CGPointMake(centerPos.x+CGFloat(cos(M_PI*moveTime)*waveDistance), centerPos.y)
        square.position = pos;
    }
    
    
}
