//
//  DaikiTestBullet.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/12/10.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class DaikiTestBullet : Bullet{
    var square: SKSpriteNode!
    var centerPos: CGPoint!
    var moveTime = 0.0
    var waveSpeed = 0.01
    var waveDistance = 0.0
    var moveSpeed: CGPoint = CGPoint(x:0.0,y:0.0)
    
    override init(obj : SKScene){
        super.init(obj: obj)
        
        position = CGPoint(x: CGRectGetMidX(obj.frame), y: 400)
        
        square = SKSpriteNode(color: UIColor.greenColor(), size: CGSizeMake(40, 40))
        square.position = position
        
        obj.addChild(square)
        
        centerPos = CGPointMake(
            position.x,
            position.y
        )
    }
    
    // called every time
    func update(){
        moveTime += waveSpeed
        centerPos = CGPointMake(centerPos.x+moveSpeed.x, centerPos.y+moveSpeed.y)
        position = CGPointMake(centerPos.x+CGFloat(cos(M_PI*moveTime)*waveDistance), centerPos.y)
        square.position = position
    }
    
    // called collision time
    override func OnCollision(enemy : Enemy) {
        super.OnCollision(enemy)
    }
}