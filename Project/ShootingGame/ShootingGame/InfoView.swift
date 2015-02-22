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
    private var scale_start : CGFloat = 1.5
    private var scale_speed : CGFloat = 0.25
    private var end_time_max = 90
    
    var delegate_escape: SceneEscapeProtocol?
    var myscene : SKScene!
    private var end_time = 0
    private var end = false
    private var infos : [SKLabelNode] = []
    init(obj : SKScene){
        super.init()
        myscene = obj
    }
    
    func update(){
        if(!end){
            if(GameManager.getInstance().isPlayerDead()){
                viewInfo(SKColor.redColor(), text: "GAME OVER")
                end = true
            }else{
                if(GameManager.getInstance().isTimeOver()){
                    if(GameManager.getInstance().isBossDead()){
                        viewInfo(SKColor.redColor(), text: "YOU WIN")
                    }else{
                        viewInfo(SKColor.redColor(), text: "TIME OVER")
                    }
                    end = true
                }
            }
        }else{
            end_time++
            if(end_time > end_time_max){
                // end
                delegate_escape!.sceneEscape(myscene)
            }
        }
        updateInfo()
    }
    func updateInfo(){
        for (var i=0; i<infos.count; i++){
            var scale = infos[i].xScale
            scale += (1.0 - scale) * scale_speed
            infos[i].xScale = scale
            infos[i].yScale = scale
        }
    }
    func viewInfo(color : SKColor, text : String){
        var mylabel = SKLabelNode(fontNamed:"AvenirNextCondensed-Heavy")
        mylabel.text = text;
        mylabel.fontSize = 64;
        mylabel.position = CGPoint(x:CGRectGetMidX(myscene.frame), y:CGRectGetMidY(myscene.frame));
        mylabel.fontColor = color
        mylabel.zPosition = 100.0
        mylabel.xScale = scale_start
        mylabel.yScale = scale_start
        myscene.addChild(mylabel);
        infos.append(mylabel)
        
    }
    
    func setDelegate(delegate :SceneEscapeProtocol){
        delegate_escape = delegate
    }
    
}