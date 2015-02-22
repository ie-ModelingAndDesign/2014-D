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
    var HP:Int = 1
    var damage_time_max = 30
    internal var position:CGPoint = CGPointMake(0,0)
    internal var colliderRadius:CGFloat = 0
    internal var myscene : SKScene!
    internal var isdamage = false
    private var damage_time = 0
    init(obj : SKScene){
        ObjectManager.getInstance().setPlayerShip(self)
        myscene = obj
        HP = LifeManager.getInstance().getLife()
    }
    
    func update(){
        if(isdamage){
            damage_time++
            if(damage_time > damage_time_max){
                isdamage = false
                damage_time = 0
            }
        }
    }
    
    func OnCollision(){
        if(isdamage == false){
            isdamage = true
            damage_time = 0
            HP -= 1
            if(HP == 0){
                Destroy()
            }
        }
    }
    
    func levelup(){
        
    }
    
    func OnCollision(bullet : EnemyBullet){
        
    }
    
    func Destroy(){
        AudioManager.getInstance().playSE(myscene, filename: "bomb.mp3")
        GameManager.getInstance().setPlayerDead()
        ObjectManager.getInstance().removePlayerShip()
    }
}