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
    private var beamArray : [Beam] = []
    private var enemybulletArray : [EnemyBullet] = []
    private var itemArray : [Item] = []
    private var removeEnemyArray : [Enemy] = []
    private var removeBulletArray : [Bullet] = []
    private var removeEnemyBulletArray : [EnemyBullet] = []
    private var removeBeamArray : [Beam] = []
    private var removeItemArray : [Item] = []
    
    private init(){
        
    }
    
    func update(){
        updateObjects()
        checkCollision_Enemy_Burret()
        checkCollision_Ship_Enemy()
        checkCollision_Ship_EnemyBullet()
        checkCollision_Enemy_Beam()
        checkCollision_Ship_Item()
        checkRemoveEnemy()
        checkRemoveBullet()
        checkRemoveEnemyBullet()
        checkRemoveBeam()
        checkRemoveItem()
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
        // update enemy bullet
        for(var i = 0; i<enemybulletArray.count;i++){
            enemybulletArray[i].update()
        }
        // update item
        for(var i = 0; i<itemArray.count;i++){
            itemArray[i].update()
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
    func setBeam(beam : Beam){
        beamArray.append(beam)
    }
    func setItem(item : Item){
         itemArray.append(item)
    }
    
    func removePlayerShip(){
        playerShip = nil
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
    func removeBeam (beam : Beam){
        removeBeamArray.append(beam)
    }
    func removeItem (item : Item){
        removeItemArray.append(item)
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
    private func checkRemoveBeam(){
        for(var i = 0; i<removeBeamArray.count; i++){
            for(var j = 0; j<beamArray.count; j++){
                if(beamArray[j] === removeBeamArray[i]){
                    beamArray.removeAtIndex(j)
                    break;
                }
            }
        }
        removeBeamArray.removeAll()
    }
    private func checkRemoveItem(){
        for(var i = 0; i<removeItemArray.count; i++){
            for(var j = 0; j<itemArray.count; j++){
                if(itemArray[j] === removeItemArray[i]){
                    itemArray.removeAtIndex(j)
                    break;
                }
            }
        }
        removeItemArray.removeAll()
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
                    enemyArray[i].OnCollision(playerShip)
                    playerShip.OnCollision()
                }
            }
        }
    }
    func checkCollision_Enemy_Beam(){
        for(var i = 0; i<enemyArray.count;i++){
            for(var j = 0; j<beamArray.count;j++){
                var subx = enemyArray[i].position.x - beamArray[j].position.x
                var suby = enemyArray[i].position.y - beamArray[j].position.y
                var distw : CGFloat = abs(subx)
                var disth : CGFloat = abs(suby)
                if(distw < beamArray[j].colliderWidth && disth < beamArray[j].colliderHeight){
                    // collision
                    enemyArray[i].OnCollision(beamArray[j])
                    println("hit by beam");
                }
            }
        }
    }
    func checkCollision_Ship_Item(){
        for(var i = 0; i<itemArray.count;i++){
            if(playerShip != nil){
                var subx = itemArray[i].position.x - playerShip.position.x
                var suby = itemArray[i].position.y - playerShip.position.y
                var dist : CGFloat = sqrt(subx*subx+suby*suby)
                if(dist < itemArray[i].colliderRadius + playerShip.colliderRadius){
                    // collision
                    println("get item!");
                    itemArray[i].OnCollision(playerShip)
                }
            }
        }
    }
    
    func isPlayerDead() -> Bool{
        return playerShip == nil
    }
}