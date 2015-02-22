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
    var HP_mult = 1.5   // 難易度調整
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
    private var vib_power_max : CGFloat = 10.0
    private var vib_power : CGFloat = 0
    private var vib_time : CGFloat = 0
    private var vib_speed : CGFloat = 0.1
    private var vib_position : CGPoint = CGPoint(x: 0,y: 0)
    init(obj : SKScene){
        ObjectManager.getInstance().setEnemy(self)
        myscene = obj
        HP += HP * Double(LevelManager.getInstance().getLevel())*HP_mult
        HP_max = HP
        
        // hp bar
        hp_bar = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(0, 0))
        hp_bar.zPosition = 50
        //hp_bar.size = CGSize(width: hp_bar_width*HP, height: hp_bar_height)
        myscene.addChild(hp_bar)
    }
    
    func update(){
        if(sprite != nil){
            sprite.position = CGPoint(x: position.x+vib_position.x, y: position.y+vib_position.y)
            sprite.zRotation = CGFloat(M_PI)*(angle/180.0)
        }
        hp_bar.position = position
        hp_bar.position.y += CGFloat(hp_bar_y)
        
        // vibrate
        vib_power *= 0.8
        //vib_time += vib_speed
        vib_position.x = CGFloat(random()%1000)/1000*vib_power
        vib_position.y = CGFloat(random()%1000)/1000*vib_power
    }
    
    func setHP(value : Double){
        HP = value
        HP += HP * Double(LevelManager.getInstance().getLevel())*HP_mult
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
        print(HP)
        HP -= value * ItemManager.getInstance().getBulletAttack()
        vib_power = vib_power_max
        if(HP <= 0){
            HP = 0.01
            ScoreManager.getInstance().addScore(Point)
            AudioManager.getInstance().playSE(myscene,filename: "zako.mp3")
            Destroy()
        }
        hp_bar.size = CGSize(width: hp_bar_width*HP, height: hp_bar_height)
    }
    
    func Destroy(){
        ItemManager.getInstance().spawnItem(myscene, position: position)
        if(sprite != nil){
            myscene.removeChildrenInArray([sprite])
        }
        myscene.removeChildrenInArray([hp_bar])
        ObjectManager.getInstance().removeEnemy(self)
    }
}