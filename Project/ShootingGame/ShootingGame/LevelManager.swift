//
//  LevelManager.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/21.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//

import Foundation

private let singleton = LevelManager()
class LevelManager{
    var level_start = 0
    var level = 0
    class func getInstance() -> LevelManager{
        return singleton
    }
    
    func levelUp(){
        level++
    }
    func getLevel() -> Int{
        return level
    }
    func resetLevel(){
        level = level_start
    }
}