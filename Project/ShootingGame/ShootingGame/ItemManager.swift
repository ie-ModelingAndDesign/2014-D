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
    private var bullet_rand : [Int] = [0,85,15]
    private var bullet_attack_add = 0.1
    private var bullet_attack_mult = 1.0
    class func getInstance() -> ItemManager{
        return singleton
    }
    
    func spawnItem(obj:SKScene, position : CGPoint){
        var total = 0
        for(var i=0; i<bullet_rand.count; i++){
            total += bullet_rand[i]
        }
        var rand = Int(arc4random())%total
        var type = 0
        for(var i=0; i<bullet_rand.count; i++){
            if(rand<bullet_rand[i]){
                type = i
                break
            }
            rand -= bullet_rand[i]
        }
        var item : Item!
        switch(type){
        case 0:
            return
        case 1:
            item = AttackUpItem(obj: obj)
            break
        case 2:
            item = BulletItem(obj: obj)
            break
        default:
            break
        }
        item.position = position
    }
    
    func upBulletAttack(){
        bullet_attack_mult += bullet_attack_add
    }
    func getBulletAttack() -> Double{
        return bullet_attack_mult
    }
}