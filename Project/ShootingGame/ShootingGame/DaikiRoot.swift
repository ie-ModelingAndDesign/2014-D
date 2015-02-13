//
//  DaikiRoot.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/11/27.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class DaikiRoot{
    var enemy_spawner : EnemySpawner!;
    init(obj : SKScene){
        /* Setup */
        var enemy = DaikiEnemy(obj:obj)
        enemy.colliderRadius = 20
        enemy_spawner = EnemySpawner(obj: obj);
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
    }
    
    func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch moves */
        
    }
    
    func update(){
        /* Called every time */
        ObjectManager.getInstance().update()
        enemy_spawner.update();
    }
    
    
}