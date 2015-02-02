//
//  EnemyBullet.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/01/15.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//

import Foundation
import SpriteKit

class EnemyBullet{
    internal var position:CGPoint = CGPointMake(0,0)
    internal var colliderRadius:CGFloat = 100
    internal var AttackPower:Float = 10.0
    internal var myscene : SKScene!
    init(obj : SKScene){
        ObjectManager.getInstance().setEnemyBullet(self)
        myscene = obj
    }
    
    func update(){
        
    }
    
    func OnCollision(bullet : Bullet){
        
    }
    
    func Destroy(){
        ObjectManager.getInstance().removeEnemyBullet(self)
    }
}