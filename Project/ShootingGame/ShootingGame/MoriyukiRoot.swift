//
//  MoriyukiRoot.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/11/27.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//

import SpriteKit
import Foundation

class MoriyukiRoot{
    var enemy2 : MoriEnemy2!
    
    init(obj : SKScene){
        
        /* Setuppppppppppppppppppppp */
                 var enemy = MoriEnemy(obj:obj)
                 enemy2 = MoriEnemy2(obj:obj)
        
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
    }
    
    func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch moves */
        
    }
    
    func update(){
        /* Called every time */
        //
        enemy2.update()
        
    }
    
    
}