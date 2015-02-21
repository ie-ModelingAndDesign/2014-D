//
//  DifficultyView.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/21.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class DifficultyView{
    private var mylabel : SKLabelNode!
    var myscene : SKScene!
    
    init(obj : SKScene){
        myscene = obj
        mylabel = SKLabelNode(fontNamed:"AvenirNextCondensed-Heavy")
        mylabel.text = "";
        mylabel.fontSize = 64;
        mylabel.position = CGPoint(x:ScreenManager.getInstance().getLeft()+10, y:ScreenManager.getInstance().getBottom() + 60);
        mylabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        mylabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Bottom
        mylabel.zPosition = 50.0
        mylabel.fontColor = UIColor.purpleColor()
        mylabel.alpha = 0.25
        myscene.addChild(mylabel);
    }
    
    func update(){
        var level = LevelManager.getInstance().getLevel()
        mylabel.text = LevelManager.getInstance().getLevelName(level);
    }
}