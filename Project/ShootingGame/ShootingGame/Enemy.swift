//
//  Enemy.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/12/05.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//
import Foundation
import SpriteKit

class Enemy{
    internal var position:CGPoint = CGPointMake(0,0)
    internal var colliderRadius:CGFloat = 20
    internal var HP:Float = 100.0
    internal var AttackPower:Float = 10.0
    internal var Point:Int = 100
    internal var myscene : SKScene!
    init(obj : SKScene){
        ObjectManager.getInstance().setEnemy(self)
        myscene = obj
    }
    
    func update(){
        
    }
    
    func OnCollision(bullet : Bullet){
        Destroy()
    }
    func OnCollision(beam : Beam){
        Destroy()
    }
    
    func Destroy(){
        ScoreManager.getInstance().addScore(Point)
        ObjectManager.getInstance().removeEnemy(self)
    }
}