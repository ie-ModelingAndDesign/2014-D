//
//  Enemy.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/12/05.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//
import Foundation
import SpriteKit

class Enemy{
    var HP:Double = 3
    var attack_power:Double = 10.0
    internal var position:CGPoint = CGPointMake(0,0)
    internal var colliderRadius:CGFloat = 20
    internal var Point:Int = 100
    internal var texture_name = ""
    internal var myscene : SKScene!
    private var sprite: SKSpriteNode!
    init(obj : SKScene){
        ObjectManager.getInstance().setEnemy(self)
        myscene = obj
    }
    
    func update(){
        if(sprite != nil){
            sprite.position = position
        }
    }
    
    func setTexture(name:String){
        texture_name = name
        var texture = SKTexture(imageNamed: texture_name)
        texture.filteringMode = SKTextureFilteringMode.Nearest
        sprite = SKSpriteNode(texture: texture)
        sprite.position = position
        sprite.zPosition = 1
        sprite.xScale *= 0.2
        sprite.yScale *= 0.2
        myscene.addChild(sprite)
    }
    
    func OnCollision(bullet : Bullet){
        Damage(bullet.attack_power)
    }
    func OnCollision(beam : Beam){
        Damage(beam.attack_power)
    }
    
    func Damage(value:Double){
        HP -= value
        if(HP <= 0){
            Destroy()
        }
    }
    
    func Destroy(){
        if(sprite != nil){
            myscene.removeChildrenInArray([sprite])
        }
        ScoreManager.getInstance().addScore(Point)
        ObjectManager.getInstance().removeEnemy(self)
    }
}