//
//  ScoreView.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/18.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class ScoreView{
    private var mylabel : SKLabelNode!
    var myscene : SKScene!
    var save = false
    init(obj : SKScene){
        myscene = obj
        mylabel = SKLabelNode(fontNamed:"Chalkduster")
        mylabel.text = String(0);
        mylabel.fontSize = 48;
        mylabel.position = CGPoint(x:CGRectGetMidX(myscene.frame), y:ScreenManager.getInstance().getTop() - 150);
        mylabel.zPosition = 50.0
        myscene.addChild(mylabel);
    }
    
    func update(){
        mylabel.text = String(ScoreManager.getInstance().getScore());
        
        if(!save){
            if(GameManager.getInstance().isPlayerDead()){
                saveScore()
            }else if(GameManager.getInstance().isTimeOver()){
                saveScore()
            }
        }
    }
    
    func saveScore(){
        save = true
        println("save score : " + String(ScoreManager.getInstance().getScore()))
    }
}