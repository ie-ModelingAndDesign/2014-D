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
    class func getInstance() -> ItemManager{
        return singleton
    }
    
    func spawnItem(obj:SKScene, position : CGPoint){
        var item = AttackUpItem(obj: obj)
        item.position = position
    }
}