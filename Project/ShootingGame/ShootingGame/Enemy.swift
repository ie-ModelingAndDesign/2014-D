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
    internal var angle : CGFloat = 0.0
    internal var colliderRadius:CGFloat = 20
    internal var Point:Int = 100
    internal var texture_name = ""
    internal var myscene : SKScene!
    private var sprite: SKSpriteNode!
    private var HP_max : Double!
    private var hp_bar : SKSpriteNode!
    private var hp_bar_y = 50.0
    private var hp_bar_height = 5.0
    private var hp_bar_width = 10.0
    init(obj : SKScene){
        ObjectManager.getInstance().setEnemy(self)
        myscene = obj
        HP_max = HP
        
        // hp bar
        hp_bar = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(0, 0))
        hp_bar.zPosition = 50
        //hp_bar.size = CGSize(width: hp_bar_width*HP, height: hp_bar_height)
        myscene.addChild(hp_bar)
    }
    
    func update(){
        if(sprite != nil){
            sprite.position = position
            sprite.zRotation = CGFloat(M_PI)*(angle/180.0)
        }
        hp_bar.position = position
        hp_bar.position.y += CGFloat(hp_bar_y)
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
    func OnCollision(player : Ship){
        Destroy()
    }
    
    func Damage(value:Double){
        HP -= value
        hp_bar.size = CGSize(width: hp_bar_width*HP, height: hp_bar_height)
        if(HP <= 0){
            Destroy()
        }
    }
    
    func Destroy(){
        if(sprite != nil){
            myscene.removeChildrenInArray([sprite])
        }
        myscene.removeChildrenInArray([hp_bar])
        ScoreManager.getInstance().addScore(Point)
        ObjectManager.getInstance().removeEnemy(self)
    }
}