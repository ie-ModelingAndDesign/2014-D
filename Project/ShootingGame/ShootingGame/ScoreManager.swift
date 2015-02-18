//
//  ScoreManager.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/18.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//

import Foundation

private let singleton = ScoreManager()
class ScoreManager{
    private var score = 0
    
    class func getInstance() -> ScoreManager{
        return singleton
    }
    
    func addScore(points:Int){
        score += points
    }
    
    func getScore()->Int{
        return score
    }
}