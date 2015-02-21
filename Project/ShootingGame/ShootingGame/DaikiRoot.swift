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
    var enemy_spawner : EnemySpawner!
    var time : TimeView!
    var score : ScoreView!
    var difficulty : DifficultyView!
    var tile : Tile!
    init(obj : SKScene){
        /* Setup */
        time = TimeView(obj:obj)
        score = ScoreView(obj:obj)
        difficulty = DifficultyView(obj: obj)
        enemy_spawner = EnemySpawner(obj: obj)
        tile = Tile(obj:obj)
        LevelManager.getInstance().resetLevel()
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
    }
    
    func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch moves */
        
    }
    
    func update(){
        /* Called every time */
        time.update();
        score.update();
        difficulty.update()
        ObjectManager.getInstance().update()
        enemy_spawner.update();
        tile.update()
    }
    
    
}