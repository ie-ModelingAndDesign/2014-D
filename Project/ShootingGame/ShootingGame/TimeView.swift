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
    var delegate_escape: SceneEscapeProtocol?
    init(obj : SKScene){
        super.init()
        
        myscene = obj
        mylabel = SKLabelNode(fontNamed:"AvenirNextCondensed-Heavy")
        mylabel.text = String(time);
        mylabel.fontSize = 256;
        mylabel.position = CGPoint(x:CGRectGetMidX(myscene.frame), y:CGRectGetMidY(myscene.frame));
        mylabel.zPosition = -50.0
        mylabel.alpha = 0.3
        myscene.addChild(mylabel);
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("onUpdateSec"), userInfo: nil, repeats: true)
        Reset()
    }
    
    func update(){
        
    }
    
    func Reset(){
        time = 60
        timeup = false
    }
    
    func setDelegate(delegate :SceneEscapeProtocol){
        delegate_escape = delegate
    }
    
    func onUpdateSec(){
        time--
        if(time <= 0 && !timeup){
            time = 0
            timeup = true
            delegate_escape!.sceneEscape(myscene)
        }
        mylabel.text = String(time)
    }
    
    func isTimeup()->Bool{
        return timeup
    }
    func getTime() -> Int{
        return time
    }
}