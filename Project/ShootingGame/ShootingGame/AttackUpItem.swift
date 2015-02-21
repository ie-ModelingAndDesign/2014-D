//
//  AttackUpItem.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/21.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class AttackUpItem : Item{
    override init(obj : SKScene){
        super.init(obj:obj)
        setTexture("ship_icon")
    }
}