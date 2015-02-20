//
//  LifeView.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/20.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class LifeView{
    private var myscene : SKScene!
    private var myship : Ship!
    private var sprites : [SKSpriteNode] = []
    private var pos = CGPoint(x: 30.0, y: 30.0)
    private var distance : CGFloat = 50.0
    private var icon_size = 0.1
    init(obj:SKScene, ship:Ship){
        myscene = obj
        myship = ship
    }
    
    func update(){
        checkLife()
    }
    
    func checkLife(){
        var life = myship.HP
        if(sprites.count < life){
            var texture = SKTexture(imageNamed: "ship_icon")
            texture.filteringMode = SKTextureFilteringMode.Nearest
            var sprite = SKSpriteNode(texture: texture)
            sprite.position = CGPoint(x: ScreenManager.getInstance().getLeft(),y: ScreenManager.getInstance().getBottom())
            sprite.position.x += distance*CGFloat(sprites.count) + pos.x
            sprite.position.y += pos.y
            sprite.zPosition = 50
            sprite.xScale *= CGFloat(icon_size)
            sprite.yScale *= CGFloat(icon_size)
            myscene.addChild(sprite)
            sprites.append(sprite)
        }else if(sprites.count > life){
            myscene.removeChildrenInArray([sprites[sprites.count-1]])
            sprites.removeAtIndex(sprites.count-1)
        }
    }
}