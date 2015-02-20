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
    internal var position:CGPoint = CGPointMake(0,0)
    internal var colliderRadius:CGFloat = 20
    internal var HP:Float = 100.0
    internal var AttackPower:Float = 10.0
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
        myscene.addChild(sprite)
    }
    
    func OnCollision(bullet : Bullet){
        Destroy()
    }
    func OnCollision(beam : Beam){
        Destroy()
    }
    
    func Destroy(){
        if(sprite != nil){
            myscene.removeChildrenInArray([sprite])
        }
        ScoreManager.getInstance().addScore(Point)
        ObjectManager.getInstance().removeEnemy(self)
    }
}