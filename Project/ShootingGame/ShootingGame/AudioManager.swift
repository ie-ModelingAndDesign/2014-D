//
//  AudioManager.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/22.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import AVFoundation
import Foundation

private let singleton = AudioManager()
class AudioManager{
    private var score = 0
    class func getInstance() -> AudioManager{
        return singleton
    }
    
    func playSE(scene : SKScene, filename : String){
        let mySoundAction: SKAction = SKAction.playSoundFileNamed(filename, waitForCompletion: true)
        scene.runAction(SKAction.repeatActionForever(mySoundAction),withKey: "sound")
    }
}