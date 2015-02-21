//
//  DifItemSpawner.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/21.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class DiffItemSpawner{
    private var item_diff_interval = 120
    private var item_diff_time = 0
    internal var myscene : SKScene!
    init(obj:SKScene){
        myscene = obj;
    }
    
    func update(){
        item_diff_time++
        if(item_diff_time > item_diff_interval){
            item_diff_time = 0
            var item = DifficultyItem(obj: myscene)
            item.position = CGPointMake(ScreenManager.getInstance().getRandomX(),ScreenManager.getInstance().getTop())
        }
    }
}