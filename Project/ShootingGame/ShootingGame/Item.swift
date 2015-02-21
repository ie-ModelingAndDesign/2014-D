//
//  Item.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/21.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import Foundation
import SpriteKit

class Item{
    var fall_speed : CGFloat = 6.0
    internal var position:CGPoint = CGPointMake(0,0)
    internal var angle : CGFloat = 0.0
    internal var colliderRadius:CGFloat = 60
    internal var myscene : SKScene!
    private var texture_name = ""
    private var sprite: SKSpriteNode!
    init(obj : SKScene){
        ObjectManager.getInstance().setItem(self)
        myscene = obj
    }
    
    func update(){
        position.y -= fall_speed
        if(sprite != nil){
            sprite.position = position
            sprite.zRotation = CGFloat(M_PI)*(angle/180.0)
        }else{
            //setTexture("")
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
        if(position.y < ScreenManager.getInstance().getBottom()){
            Destroy()
        }
    }
    
    func OnCollision(ship : Ship){
        Destroy()
    }
    
    func Destroy(){
        if(sprite != nil){
            myscene.removeChildrenInArray([sprite])
        }
        ObjectManager.getInstance().removeItem(self)
    }
}