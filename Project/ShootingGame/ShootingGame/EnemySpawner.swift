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
    var timeA = 0;
    var timeB = 0;
    init(obj:SKScene){
        myscene = obj;
    }
    
    func update(){
        timeA++;
        if(timeA >= 20){
            timeA = 0;
            spawnEnemy(0);
        }
        timeB++;
        if(timeB >= 40){
            timeB = 0;
            spawnEnemy(1);
        }
    }
    
    func spawnEnemy(n:Int){
        var enemy:Enemy!
        switch(n){
        case 0:
            enemy = DaikiEnemy(obj: myscene)
            enemy.colliderRadius = 20
            break;
        case 1:
            enemy = MoriEnemy(obj:myscene)
            enemy.colliderRadius = 30
        default :
            break;
        }
    }
}