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
    internal var colliderRadius:CGFloat = 0
    internal var HP:Float = 100
    init(obj : SKScene){
        ObjectManager.getInstance().setEnemy(self)
    }
    
    func update(){
        
    }
    
    func OnCollision(bullet : Bullet){
        
    }
}