//
//  SchoolBoss.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/22.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//

import SpriteKit
import Foundation

class SchoolBoss : Enemy{
    private var speed : CGFloat = 0.1
    private var attack_interval = 10
    private var attack_value_max = 2
    private var attack_position = CGPointMake(50, 50)
    private var texture_names : [String] = ["koki_4","koki_5","koki_6","koki_7","koki_8","akihiko2"]
    private var mode = "begin"
    private var move_y : CGFloat = ScreenManager.getInstance().getTop()-150.0
    private var move_right : CGFloat = ScreenManager.getInstance().getRight()-100
    private var move_left : CGFloat = ScreenManager.getInstance().getLeft()+100
    private var move_target : CGFloat = 0
    private var right = false
    private var attack_time = 0
    private var attack_value = 0
    private var dead = false
    override init(obj : SKScene){
        super.init(obj: obj)
        position = CGPoint(x: CGRectGetMidX(obj.frame), y: ScreenManager.getInstance().getTop()+50)
    }
    
    // called every time
    override func update(){
        super.update()
        if(!dead){
            switch(mode){
            case "begin":
                moveBegin()
                break
            case "move":
                moveX()
                break
            case "attack":
                moveAttack()
                break
            default:
                break
            }
        }else{
            if(GameManager.getInstance().isTimeOver() || GameManager.getInstance().isPlayerDead()){
                super.Destroy()
            }
        }
    }
    
    func moveBegin(){
        position.y -= 3
        if(position.y < move_y){
            mode = "move"
            if(right){
                move_target = move_right
            }else{
                move_target = move_left
            }
            right = !right
        }
    }
    
    func moveX(){
        var dif = (move_target-position.x)*speed
        position.x += dif
        if(abs(dif) < 0.5){
            mode = "attack"
            attack_time = 999
            attack_value = 0
        }
    }
    
    func moveAttack(){
        attack_time++
        if(attack_time > attack_interval){
            var enemy = ThrowEnemy(obj:myscene)
            enemy.position = CGPointMake(position.x + attack_position.x, position.y + attack_position.y)
            enemy.setHP(5.0)
            var ran = Int(arc4random()) % (texture_names.count)
            enemy.setTexture(texture_names[ran])
            attack_time = 0
            attack_value++
            if(attack_value >= attack_value_max){
                mode = "move"
                if(right){
                    move_target = move_right
                }else{
                    move_target = move_left
                }
                right = !right
            }
        }
    }
    
    override func OnCollision(player: Ship) {
        
    }
    
    override func Destroy() {
        HP = 1
        dead = true
        GameManager.getInstance().setBossDead()
    }
    
}

