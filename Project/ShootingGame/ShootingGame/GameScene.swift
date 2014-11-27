//
//  GameScene.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2014/11/27.
//  Copyright (c) 2014年 GroupD. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var koukiRoot : KoukiRoot!
    var moriyukiRoot : MoriyukiRoot!
    var akihikoRoot : AkihikoRoot!
    var daikiRoot : DaikiRoot!
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        
        // root
        koukiRoot = KoukiRoot(obj: self)
        moriyukiRoot = MoriyukiRoot(obj: self)
        akihikoRoot = AkihikoRoot(obj: self)
        daikiRoot = DaikiRoot(obj: self)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        
        // root
        koukiRoot.touchesBegan(touches, withEvent: event)
        moriyukiRoot.touchesBegan(touches, withEvent: event)
        akihikoRoot.touchesBegan(touches, withEvent: event)
        daikiRoot.touchesBegan(touches, withEvent: event)
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch moves */
        
        // root
        koukiRoot.touchesMoved(touches, withEvent: event)
        moriyukiRoot.touchesMoved(touches, withEvent: event)
        akihikoRoot.touchesMoved(touches, withEvent: event)
        daikiRoot.touchesMoved(touches, withEvent: event)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */

        
        // root
        koukiRoot.update()
        moriyukiRoot.update()
        akihikoRoot.update()
        daikiRoot.update()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent){
        akihikoRoot.touchesEnded(touches, withEvent: event)
    }
    
    
}
