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
    var attack_power = 1.0
    internal var position:CGPoint = CGPointMake(0,0)
    internal var colliderRadius:CGFloat = 0
    internal var myscene : SKScene!
    private var texture_name = ""
    private var sprite: SKSpriteNode!
    init(obj : SKScene){
        ObjectManager.getInstance().setBullet(self)
        myscene = obj
    }
    
    func update(){
        if(sprite != nil){
            sprite.position = position
        }
        checkOutDisplay();
    }
    
    func setTexture(name:String){
        texture_name = name
        var texture = SKTexture(imageNamed: texture_name)
        texture.filteringMode = SKTextureFilteringMode.Nearest
        sprite = SKSpriteNode(texture: texture)
        sprite.position = position
        sprite.zPosition = 1
        sprite.xScale *= 0.15
        sprite.yScale *= 0.15
        myscene.addChild(sprite)
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
        if(sprite != nil){
            myscene.removeChildrenInArray([sprite])
        }
        ObjectManager.getInstance().removeBullet(self)
    }
}