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
    private var playerShip : Ship!
    private var enemyArray : [Enemy] = []
    private var bulletArray : [Bullet] = []
    private var enemybulletArray : [EnemyBullet] = []
    private var removeEnemyArray : [Enemy] = []
    private var removeBulletArray : [Bullet] = []
    private var removeEnemyBulletArray : [EnemyBullet] = []
    
    private init(){
        
    }
    
    func update(){
        updateObjects()
        checkCollision_Enemy_Burret()
        checkCollision_Ship_Enemy()
        checkCollision_Ship_EnemyBullet()
        checkRemoveEnemy()
        checkRemoveBullet()
        checkRemoveEnemyBullet()
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
        for(var i = 0; i<enemybulletArray.count;i++){
            enemybulletArray[i].update()
        }
    }
    func setPlayerShip(ship : Ship){
        playerShip = ship
    }
    func setEnemy(enemy : Enemy){
        enemyArray.append(enemy)
    }
    func setBullet(bullet : Bullet){
        bulletArray.append(bullet)
    }
    func setEnemyBullet(bullet : EnemyBullet){
        enemybulletArray.append(bullet)
    }
    
    func removeEnemy(enemy : Enemy){
        removeEnemyArray.append(enemy)
    }
    func removeBullet(bullet : Bullet){
        removeBulletArray.append(bullet)
    }
    func removeEnemyBullet(bullet : EnemyBullet){
        removeEnemyBulletArray.append(bullet)
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
    let j = M_PI / 180
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
    private func checkRemoveEnemyBullet(){
        for(var i = 0; i<removeEnemyBulletArray.count; i++){
            for(var j = 0; j<enemybulletArray.count; j++){
                if(enemybulletArray[j] === removeEnemyBulletArray[i]){
                    enemybulletArray.removeAtIndex(j)
                    break;
                }
            }
        }
        removeEnemyBulletArray.removeAll()
    }
    
    func checkCollision_Enemy_Burret(){
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
    func checkCollision_Ship_EnemyBullet(){
        for(var i = 0; i<enemybulletArray.count;i++){
            if(playerShip != nil){
                var subx = enemybulletArray[i].position.x - playerShip.position.x
                var suby = enemybulletArray[i].position.y - playerShip.position.y
                var dist : CGFloat = sqrt(subx*subx+suby*suby)
                if(dist < enemybulletArray[i].colliderRadius + playerShip.colliderRadius){
                    // collision
                    println("player damage!by enemy bullet");
                }
            }
        }
    }
    func checkCollision_Ship_Enemy(){
        for(var i = 0; i<enemyArray.count;i++){
            if(playerShip != nil){
                var subx = enemyArray[i].position.x - playerShip.position.x
                var suby = enemyArray[i].position.y - playerShip.position.y
                var dist : CGFloat = sqrt(subx*subx+suby*suby)
                if(dist < enemyArray[i].colliderRadius + playerShip.colliderRadius){
                    // collision
                    println("player damage!by enemy");
                }
            }
        }
    }
}