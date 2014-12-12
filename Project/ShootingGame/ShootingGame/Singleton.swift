//
//  Singleton.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/12/08.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//

import Foundation

private let singleton = Singleton()
class Singleton {
    private init(){}
    
    class func getInstance() -> Singleton{
        return singleton
    }
}