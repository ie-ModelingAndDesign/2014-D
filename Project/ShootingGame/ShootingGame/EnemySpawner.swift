//
//  EnemySpawner.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/13.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//

import Foundation
import SpriteKit

class EnemySpawner{
    var spawn_interval_min = 5
    var spawn_interval_max = 15
    var spawn_time_list : [Int] =   [10, 5,15,15,15,15]
    var spawn_value_list : [Int] =  [ 5, 4, 5, 3, 5, 5]
    internal var myscene : SKScene!
    
    private var spawn_time = 0
    private var spawn_time_max = 0
    private var spawn_next = 0
    private var spawn_value = 0
    private var spawn = false
    init(obj:SKScene){
        myscene = obj;
        resetSpawnStatus()
    }
    
    func update(){
        spawn_time++
        if(spawn){
            // spawn mode
            if(spawn_time > spawn_time_list[spawn_next]){
                spawn_time = 0
                spawn_value++
                spawnEnemy(spawn_next)
                if(spawn_value >= spawn_value_list[spawn_next]){
                    resetSpawnStatus()
                    spawn = false
                }
            }
        }else{
            // wait mode
            if(spawn_time > spawn_time_max){
                spawn_time = 0
                spawn_next = Int(arc4random()) % (spawn_time_list.count)
                spawn = true
            }
        }
    }
    
    func resetSpawnStatus(){
        spawn_time_max = Int(arc4random())%(spawn_interval_max - spawn_interval_min) + spawn_interval_min
        spawn_time = 0
        spawn_value = 0
    }
    
    func spawnEnemy(n:Int){
        var enemy:Enemy!
        switch(n){
        case 0:
            // Sin波でX軸をウロウロしながら降りてくる
            enemy = DaikiEnemy(obj: myscene)
            enemy.colliderRadius = 40
            enemy.setTexture("daiki2")
            enemy.setHP(3.0)
            break;
        case 1:
            // 左右に往復
            enemy = MoriEnemy(obj:myscene)
            enemy.colliderRadius = 60
            enemy.setTexture("moriyuki1")
            enemy.setHP(6.0)
        case 2:
            // ランダム移動
            enemy = MoriEnemy2(obj:myscene)
            enemy.colliderRadius = 60
            enemy.setTexture("koki_1")
            enemy.setHP(3.0)
        case 3:
            // 横から飛び出る
            enemy = MoriEnemy3(obj:myscene)
            enemy.colliderRadius = 60
            enemy.setTexture("daiki1")
            enemy.HP = 1.0
        case 4:
            // 上から落ちてくる
            enemy = MoriEnemy5(obj:myscene)
            enemy.colliderRadius = 60
            enemy.setTexture("akihiko1")
            enemy.setHP(2.0)
        case 5:
            // 回る
            enemy = MoriEnemy6(obj:myscene)
            enemy.colliderRadius = 60
            enemy.setTexture("akihiko3")
            enemy.setHP(3.0)
        /*case 6:
            // 楕円
            enemy = MoriEnemy7(obj:myscene)
            enemy.colliderRadius = 60
            enemy.setTexture("akihiko3")*/
        case 6:
            // 不規則にカーブ
            enemy = MoriEnemy9(obj:myscene)
            enemy.colliderRadius = 60
            enemy.setTexture("akihiko4")
            enemy.setHP(5.0)
        default :
            break;
        }
    }
}