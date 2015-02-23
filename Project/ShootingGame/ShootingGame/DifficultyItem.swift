//
//  DifficultyItem.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/21.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class DifficultyItem : Item{
    override init(obj : SKScene){
        super.init(obj:obj)
        setTexture("item_level")
    }
    override func OnCollision(ship : Ship){
        LevelManager.getInstance().levelUp()
        AudioManager.getInstance().playSE(myscene, filename: "levelup.mp3")
        super.OnCollision(ship)
    }
}