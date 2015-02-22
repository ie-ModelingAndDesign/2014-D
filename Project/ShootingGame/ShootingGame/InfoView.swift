//
//  InfoView.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/22.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class InfoView : NSObject{
    private var mylabel : SKLabelNode!
    var delegate_escape: SceneEscapeProtocol?
    private var end = false
    init(obj : SKScene){
        super.init()
    }
    
    func update(){
        if(!end){
            if(GameManager.getInstance().isPlayerDead()){
                println("GAME OVER")
                end = true
            }else{
                if(GameManager.getInstance().isTimeOver()){
                    if(GameManager.getInstance().isBossDead()){
                        println("YOU WIN")
                    }else{
                        println("TIME OVER")
                    }
                    end = true
                }
            }
        }
    }
    
    func setDelegate(delegate :SceneEscapeProtocol){
        delegate_escape = delegate
    }
    
}