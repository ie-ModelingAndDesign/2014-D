//
//  KoukiRoot.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/11/27.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class KoukiRoot{
    
    var enemy : KokiEnemy!
    //var enemy2 : KokiEnemy2!
    
    init(obj : SKScene){
        /* Setup */
        enemy = KokiEnemy(obj:obj)
       // enemy2 = KokiEnemy2(obj:obj)

    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
    }
    
    func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch moves */
        
    }
    
    func update(){
        enemy.update()
        //enemy2.update()
    }
    
    
}