//
//  AkihikoEnemyBullet1.swift
//  ShootingGame
//
//  Created by Akihiko Igarashi on 2014/12/28.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//

import Foundation
import SpriteKit

private var bullet: SKSpriteNode!
private var px:CGFloat!
private var py:CGFloat!


class AkihikoEnemyBullet1{
    
    init(obj:SKScene, Pos:CGPoint, x:CGFloat, y:CGFloat){

        px=x
        py=y
        bullet = SKSpriteNode(imageNamed:"ball.png")
        bullet.position = Pos
        obj.addChild(bullet)

    }
    
    func update(){

        bullet.position = CGPoint(
            x: bullet.position.x+px, y:bullet.position.y+py
        )

    }
    
}