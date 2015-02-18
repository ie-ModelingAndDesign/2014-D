//
//  TimeView.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/18.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//
import SpriteKit
import Foundation

class TimeView : NSObject{
    private var mylabel : SKLabelNode!
    var myscene : SKScene!
    var time = 60
    var timeup = false;
    
    init(obj : SKScene){
        super.init()
        
        myscene = obj
        mylabel = SKLabelNode(fontNamed:"Chalkduster")
        mylabel.text = String(time);
        mylabel.fontSize = 48;
        mylabel.position = CGPoint(x:CGRectGetMidX(myscene.frame), y:ScreenManager.getInstance().getTop() - 100);
        myscene.addChild(mylabel);
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("onUpdateSec"), userInfo: nil, repeats: true)
    }
    
    func update(){
        
    }
    
    func onUpdateSec(){
        time--
        if(time <= 0){
            time = 0
            timeup = true
        }
        mylabel.text = String(time)
    }
    
    func isTimeup()->Bool{
        return timeup
    }
}