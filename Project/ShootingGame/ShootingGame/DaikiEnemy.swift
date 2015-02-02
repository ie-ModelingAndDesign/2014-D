//
//  DaikiEnemy.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/11/27.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class DaikiEnemy : Enemy{
    var square: SKSpriteNode!
    var centerPos: CGPoint!
    var moveTime = 0.0
    var waveSpeed = 0.01
    var waveDistance = 200.0
    var moveSpeed: CGPoint = CGPoint(x:0.0,y:-1.0)
    
    override init(obj : SKScene){
        super.init(obj: obj)
        position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMaxY(obj.frame))
        
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(40, 40))
        square.position = position
        
        obj.addChild(square)
        
        centerPos = CGPointMake(
            position.x,
            position.y
        )
    }
    
    // called every time
    override func update(){
        super.update()
        moveTime += waveSpeed
        centerPos = CGPointMake(centerPos.x+moveSpeed.x, centerPos.y+moveSpeed.y)
        position = CGPointMake(centerPos.x+CGFloat(cos(M_PI*moveTime)*waveDistance), centerPos.y)
        square.position = position
    }
    
    override func OnCollision(bullet: Bullet) {
        super.OnCollision(bullet)
        myscene.removeChildrenInArray([square])
    }
    
    override func OnCollision(beam: Beam) {
        super.OnCollision(beam)
        myscene.removeChildrenInArray([square])
    }
    
    
}
