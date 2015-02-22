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
    var delegate_escape: SceneEscapeProtocol?
    
    var time : TimeView!
    var score : ScoreView!
    var difficulty : DifficultyView!
    var info : InfoView!
    var enemy_spawner : EnemySpawner!
    var diff_spawner : DiffItemSpawner!
    var tile : Tile!
    var bgm : BGMPlayer!
    init(obj : SKScene){
        /* Setup */
        ObjectManager.getInstance().Reset()
        time = TimeView(obj:obj)
        time.Reset()
        score = ScoreView(obj:obj)
        difficulty = DifficultyView(obj: obj)
        info = InfoView(obj: obj)
        enemy_spawner = EnemySpawner(obj: obj)
        enemy_spawner.setTimer(time)
        diff_spawner = DiffItemSpawner(obj: obj)
        tile = Tile(obj:obj)
        GameManager.getInstance().Reset()
        LevelManager.getInstance().resetLevel()
        ScoreManager.getInstance().Reset()
        bgm = BGMPlayer(obj:obj)
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
    }
    
    func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch moves */
        
    }
    
    func setDelegate(delegate : SceneEscapeProtocol){
        delegate_escape = delegate
        time.setDelegate(delegate)
        info.setDelegate(delegate)
    }
    
    func update(){
        /* Called every time */
        time.update();
        score.update();
        difficulty.update()
        info.update()
        ObjectManager.getInstance().update()
        enemy_spawner.update();
        diff_spawner.update()
        tile.update()
        bgm.update()
        
    }
    
    
}