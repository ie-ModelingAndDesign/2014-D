//
//  Beam.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/01/16.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//

import Foundation
import SpriteKit

class Beam{
    var attack_power = 5.0
    internal var position:CGPoint = CGPointMake(0,0)
    internal var colliderWidth:CGFloat = 0
    internal var colliderHeight:CGFloat = 0
    internal var myscene : SKScene!
    init(obj : SKScene){
        ObjectManager.getInstance().setBeam(self)
        myscene = obj
    }
    
    func update(){
        
    }
    
    func Destroy(){
        ObjectManager.getInstance().removeBeam(self)
    }
}