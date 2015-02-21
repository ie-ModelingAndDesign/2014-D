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
        setTexture("item_plus")
    }
    override func OnCollision(ship : Ship){
        
        super.OnCollision(ship)
    }
}