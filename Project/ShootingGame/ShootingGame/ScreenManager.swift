//
//  ScreenManager.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/12/25.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//

import Foundation
import SpriteKit


private let singleton = ScreenManager()
class ScreenManager {
    private var screenLeft : CGFloat = 300
    private var screenRight : CGFloat = 720
    private var screenTop : CGFloat = 800
    private var screenBottom : CGFloat = 0
    private init(){
        
    }
    
    func update(){
        
    }
    
    class func getInstance() -> ScreenManager{
        return singleton
    }
    
    func getLeft() -> CGFloat{
        return screenLeft
    }
    func getRight() -> CGFloat{
        return screenRight
    }
    func getMid() -> CGFloat{
        return screenLeft+(screenRight-screenLeft)/2
    }
    func getTop() -> CGFloat{
        return screenTop
    }
    func getBottom() -> CGFloat{
        return screenBottom
    }
    func getRandomX() -> CGFloat{
        return CGFloat(random()%1000)/1000*(screenRight-screenLeft)+screenLeft
    }
    func getRandomY() -> CGFloat{
        return CGFloat(random()%1000)/1000*(screenTop-screenBottom)+screenBottom
    }

}