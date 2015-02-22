//
//  ThrowEnemy.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/22.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class ThrowEnemy : Enemy{
    private var speed : CGFloat = 15.0
    private var rot_speed_max : CGFloat = 30.0
    private var vector  = CGPoint(x: 0,y: 0)
    private var rad = -1.0
    private var rot : CGFloat!
    private var go = false
    override init(obj : SKScene){
        super.init(obj: obj)
        rot = CGFloat(arc4random()%1000)/1000*rot_speed_max*2-rot_speed_max
    }
    
    // called every time
    override func update(){
        super.update()
        if(!go && !ObjectManager.getInstance().isPlayerDead()){
            go = true
            var ppos = ObjectManager.getInstance().getPlayer().position
            rad = Double(atan2(ppos.y-position.y,ppos.x-position.x))
        }
        position.x += CGFloat(cos(rad)) * speed
        position.y += CGFloat(sin(rad)) * speed
        angle += rot
        if(position.y < ScreenManager.getInstance().getBottom()-60){
            Destroy()
        }
    }
    
    
}
