//
//  BgmPlayer.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/22.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation
import AVFoundation

class BGMPlayer{
    private var myscene : SKScene!
    //var mySoundAction : SKAction
    init(obj:SKScene){
        myscene = obj
        /*
        mySoundAction = SKAction.playSoundFileNamed("music.mp3", waitForCompletion: true)
        myscene.runAction(SKAction.repeatActionForever(mySoundAction),withKey: "bgm")*/
    }
    
    func update(){
        /*if(GameManager.getInstance().isTimeOver() || GameManager.getInstance().isPlayerDead()){
            myscene.removeActionForKey("bgm")
        }*/
    }
}