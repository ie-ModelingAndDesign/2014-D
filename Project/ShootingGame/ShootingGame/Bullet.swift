//
//  Bullet.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/12/10.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//

import Foundation
import SpriteKit

class Bullet{
    internal var position:CGPoint = CGPointMake(0,0)
    internal var colliderRadius:CGFloat = 0
    internal var myscene : SKScene!
    init(obj : SKScene){
        ObjectManager.getInstance().setBullet(self)
        myscene = obj
    }
    
    func update(){
        checkOutDisplay();
    }
    
    func checkOutDisplay(){
        if(position.y > ScreenManager.getInstance().getTop()){
            Destroy()
        }
    }
    
    func OnCollision(enemy : Enemy){
        Destroy()
    }
    
    func Destroy(){
        ObjectManager.getInstance().removeBullet(self)
    }
}