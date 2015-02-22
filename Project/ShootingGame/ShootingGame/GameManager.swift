//
//  GameManager.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/22.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//

import Foundation
import SpriteKit


private let singleton = GameManager()
class GameManager {
    private var playerdead = false
    private var timeover = false
    private var bossdead = false
    private init(){
        
    }
    
    class func getInstance() -> GameManager{
        return singleton
    }
    
    func update(){
        
    }
    
    func Reset(){
        playerdead = false
        timeover = false
        bossdead = false
    }
    
    func setPlayerDead(){
        playerdead = true
    }
    func isPlayerDead() -> Bool{
        return playerdead
    }
    func setTimeOver(){
        timeover = true
    }
    func isTimeOver() -> Bool{
        return timeover
    }
    func setBossDead(){
        bossdead = true
    }
    func isBossDead() -> Bool{
        return bossdead
    }
}