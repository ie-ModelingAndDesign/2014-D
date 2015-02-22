//
//  LifeManager.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/22.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

private let singleton = LifeManager()
class LifeManager{
    private var life = 1
    class func getInstance() -> LifeManager{
        return singleton
    }

    func setLife(value : Int){
        life = value
    }
    
    func resetLife(){
        life = 1
    }
    
    func getLife() -> Int{
        return life
    }
}