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
    var level_name : [String] = [
        "EASY","NOMAL","HARD","ADVANCED","PRO",
        "IMPOSSIBLE","KILLER","APOCALYPSE","HELL","GOD","OS"
    ]
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
    func getLevelName(level_num : Int) -> String{
        if(level_num > level_name.count-1){
            var name = level_name[level_name.count-1]
            for(var i=0; i<=level_num-level_name.count-1; i++){
                name = name + "+"
            }
            return name
        }
        return level_name[level_num]
    }
}