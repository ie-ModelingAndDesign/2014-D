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
    
    internal var myscene : SKScene!
    var timeA = 0
    var timeB = 0
    var timeC = 0
    init(obj:SKScene){
        myscene = obj;
    }
    
    func update(){
        timeA++;
        if(timeA >= 60){
            timeA = 0;
            spawnEnemy(0);
        }
        timeB++;
        if(timeB >= 120){
            timeB = 0;
            spawnEnemy(1);
        }
        timeC++;
        if(timeC >= 60){
            timeC = 0;
            spawnEnemy(2);
        }
    }
    
    func spawnEnemy(n:Int){
        var enemy:Enemy!
        switch(n){
        case 0:
            enemy = DaikiEnemy(obj: myscene)
            enemy.colliderRadius = 40
            enemy.setTexture("daiki2")
            break;
        case 1:
            enemy = MoriEnemy(obj:myscene)
            enemy.colliderRadius = 60
            enemy.setTexture("moriyuki1")
            enemy.HP = 10.0
        case 2:
            enemy = MoriEnemy3(obj:myscene)
            enemy.colliderRadius = 60
            enemy.setTexture("daiki1")
        default :
            break;
        }
    }
}