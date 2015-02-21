//
//  MoriEnemy6.swift
//  stg
//
//  Created by inamine moriyuki on 2015/01/15.
//  Copyright (c) 2015年 inamine moriyuki. All rights reserved.


//　　　　円運動

import Foundation
import SpriteKit

class MoriEnemy6 : Enemy{
    var square: SKSpriteNode!
    
    
    var centerPos: CGPoint!
    
    
    
    var timer = NSTimer()
    override init (obj : SKScene) {
        super.init(obj: obj);
        
        square = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(50, 50))
        
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: ScreenManager.getInstance().getTop())
        square.alpha = 0    // 非表示
        
        
        obj.addChild(square)
        
        centerPos = CGPointMake(
            square.position.x,
            square.position.y
            
            
            
        )
        
        
    }
    
    
    var rot = 90.0 //角度

    
    override func update() {
        super.update()
        var angle = 5.0
            
            
        rot += angle;
            
        //角度
        let rad =  M_PI * (rot/180.0)
        
            if(square != nil){
                //円運動の計算
                square.position.y -= 5.0
                position.x = square.position.x + CGFloat(cos(rad)) * 100
                position.y = square.position.y + CGFloat(sin(rad)) * 100
                if(position.y < ScreenManager.getInstance().getBottom()-60){
                    Destroy(false)
                }
            }
        }
        
    
    override func Destroy(point : Bool){
        if(square != nil){
            myscene.removeChildrenInArray([square])
        }
        square = nil
        super.Destroy(point)
    }


}
        