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
    var time = 0;
    init(obj:SKScene){
        myscene = obj;
    }
    
    func update(){
        time++;
        if(time >= 30){
            time = 0;
            spawnEnemy(0);
        }
    }
    
    func spawnEnemy(n:Int){
        var enemy:Enemy!
        switch(n){
        case 0:
            enemy = DaikiEnemy(obj: myscene);
            enemy.colliderRadius = 20
            break;
        default :
            break;
        }
    }
}