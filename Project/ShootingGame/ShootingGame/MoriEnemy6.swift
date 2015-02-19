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
        
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMidY(obj.frame))
        
        
        
        obj.addChild(square)
        
        centerPos = CGPointMake(
            square.position.x,
            square.position.y
            
            
            
        )
        println(centerPos)
        
        
    }
    
    
    var rot = 0.0 //角度

    
    override func update() {
        super.update()
        var angle = 0.9
            
            
        rot += angle;
            
        //角度
        let rad =  rot * M_PI / 50
        
            if(square != nil){
                position = square.position
                //円運動の計算
                square.position.x = square.position.x + CGFloat(5*cos(rad)) * 2
                square.position.y = square.position.y + CGFloat(5*sin(rad)) * 2
            }
        }
        
    
    override func Destroy(){
        if(square != nil){
            myscene.removeChildrenInArray([square])
        }
        square = nil
        super.Destroy()
    }


}
        