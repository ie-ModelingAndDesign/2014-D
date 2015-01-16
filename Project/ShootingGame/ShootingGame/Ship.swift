//
//  Ship.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/12/25.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//

import Foundation
import SpriteKit

class Ship{
    internal var position:CGPoint = CGPointMake(0,0)
    internal var colliderRadius:CGFloat = 0
    internal var HP:Float = 0.0
    internal var myscene : SKScene!
    init(obj : SKScene){
        ObjectManager.getInstance().setPlayerShip(self)
        myscene = obj
    }
    
    func update(){
        
    }
    
    func OnCollision(enemy : Enemy){
        
    }
    func OnCollision(bullet : EnemyBullet){
        HP -= bullet.AttackPower;
    }
    
    func Destroy(){
        //ObjectManager.getInstance().removeBullet(self)
    }
}