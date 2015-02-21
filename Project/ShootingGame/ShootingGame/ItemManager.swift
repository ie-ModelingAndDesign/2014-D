//
//  ItemManager.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/21.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

private let singleton = ItemManager()
class ItemManager{
    private var bullet_attack_add = 0.2
    private var bullet_attack_mult = 1.0
    class func getInstance() -> ItemManager{
        return singleton
    }
    
    func spawnItem(obj:SKScene, position : CGPoint){
        var item = AttackUpItem(obj: obj)
        item.position = position
    }
    
    func upBulletAttack(){
        bullet_attack_mult += bullet_attack_add
    }
    func getBulletAttack() -> Double{
        return bullet_attack_mult
    }
}