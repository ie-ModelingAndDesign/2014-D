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
    private var boss = false
    var audio : AVAudioFile!
    var player : AVAudioPlayer!
    var player2 : AVAudioPlayer!
    var engine : AVAudioEngine!
    //var mySoundAction : SKAction
    init(obj:SKScene){
        myscene = obj
        
        engine = AVAudioEngine()
        
        var sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BGM_stage", ofType: "mp3")!)
        //audio = AVAudioFile(forReading: NSURL(fileURLWithPath: path), error: nil)
        println(sound)
        player = AVAudioPlayer(contentsOfURL: sound, error: nil)
        player.play()
        player.volume = 1.0
        player.numberOfLoops = 99   // 無限ループ
        /*
        mySoundAction = SKAction.playSoundFileNamed("music.mp3", waitForCompletion: true)
        myscene.runAction(SKAction.repeatActionForever(mySoundAction),withKey: "bgm")*/
    }
    
    func update(){
        if(GameManager.getInstance().isTimeOver() || GameManager.getInstance().isPlayerDead()){
            player.stop()
        }else{
            if(!boss && GameManager.getInstance().isBossCome()){
                boss = true
                var sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("BGM_boss", ofType: "mp3")!)
                player = AVAudioPlayer(contentsOfURL: sound, error: nil)
                player.play()
            }
        }
    }
}