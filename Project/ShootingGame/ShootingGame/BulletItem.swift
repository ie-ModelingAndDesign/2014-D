//
//  BulletItem.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/21.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class BulletItem : Item{
    override init(obj : SKScene){
        super.init(obj:obj)
        setTexture("item_attack")
    }
    override func OnCollision(ship : Ship){
        ship.levelup()
        super.OnCollision(ship)
    }
}