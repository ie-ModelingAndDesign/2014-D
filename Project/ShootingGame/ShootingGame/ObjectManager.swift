//
//  ObjectManager.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/12/05.
//  Copyright (c) 2014年 GroupD. All rights reserved.
// hogegehogehoge

import Foundation
import SpriteKit

private let singleton = ObjectManager()
class ObjectManager{
    
    private var enemyArray : [Enemy] = []
    private var bulletArray : [Bullet] = []
    private var removeEnemyArray : [Enemy] = []
    private var removeBulletArray : [Bullet] = []
    
    private init(){
        
    }
    
    func update(){
        updateObjects()
        checkCollision()
        checkRemoveEnemy()
    }
    
    class func getInstance() -> ObjectManager{
        return singleton
    }
    
    func updateObjects(){
        // update enemy
        for(var i = 0; i<enemyArray.count;i++){
            enemyArray[i].update()
        }
        // update bullet
        for(var i = 0; i<bulletArray.count;i++){
            bulletArray[i].update()
        }
    }
    func setEnemy(enemy : Enemy){
        enemyArray.append(enemy)
    }
    func setBullet(bullet : Bullet){
        bulletArray.append(bullet)
    }
    
    func removeEnemy(enemy : Enemy){
        removeEnemyArray.append(enemy)
    }
    func removeBullet(bullet : Bullet){
        removeBulletArray.append(bullet)
    }
    
    private func checkRemoveEnemy(){
        for(var i = 0; i<removeEnemyArray.count; i++){
            for(var j = 0; j<enemyArray.count; j++){
                if(enemyArray[j] === removeEnemyArray[i]){
                    enemyArray.removeAtIndex(j)
                    break;
                }
            }
        }
        removeEnemyArray.removeAll()
    }
    
    private func checkRemoveBullet(){
        for(var i = 0; i<removeBulletArray.count; i++){
            for(var j = 0; j<bulletArray.count; j++){
                if(bulletArray[j] === removeBulletArray[i]){
                    bulletArray.removeAtIndex(j)
                    break;
                }
            }
        }
        removeBulletArray.removeAll()
    }
    
    func checkCollision(){
        for(var i = 0; i<enemyArray.count;i++){
            for(var j = 0; j<bulletArray.count;j++){
                var subx = enemyArray[i].position.x - bulletArray[j].position.x
                var suby = enemyArray[i].position.y - bulletArray[j].position.y
                var dist : CGFloat = sqrt(subx*subx+suby*suby)
                if(dist < enemyArray[i].colliderRadius + bulletArray[j].colliderRadius){
                    // collision
                    enemyArray[i].OnCollision(bulletArray[j])
                    bulletArray[j].OnCollision(enemyArray[i])
                    println("hit");
                }
            }
        }
    }
}