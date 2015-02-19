//
//  Tile.swift
//  ShootingGame
//
//  Created by Daiki Oyakawa on 2015/02/19.
//  Copyright (c) 2015年 GroupD. All rights reserved.
//

import SpriteKit
import Foundation

class Tile{
    var speed : CGFloat = 10.0
    internal var myscene : SKScene!
    private var time = 0
    var tiles : [SKSpriteNode] = []
    var tile_value = 3
    var tile_dist : CGFloat = 0.0
    var tile_height : CGFloat!
    init(obj: SKScene) {
        myscene = obj
        for(var i=0; i<tile_value; i++){
            var texture = SKTexture(imageNamed: "tile")
            texture.filteringMode = SKTextureFilteringMode.Nearest
            var sprite = SKSpriteNode(texture: texture)
            sprite.position = CGPoint(x: ScreenManager.getInstance().getMid(), y: ScreenManager.getInstance().getTop())
            sprite.xScale *= 1.0
            sprite.yScale *= 1.0
            sprite.zPosition = -100
            tiles.append(sprite)
            myscene.addChild(sprite)
        }
        tile_height = tiles[0].texture?.size().height
        /*var skylineTexture = SKTexture(imageNamed: "title")
        skylineTexture.filteringMode = SKTextureFilteringNearest*/
    }
    
    func update(){
        time++
        if(time > 0){
            time = 0
            tile_dist -= speed
            tile_dist = tile_dist % tile_height
            for(var i=0; i<tile_value; i++){
                tiles[i].position.y = tile_dist+tile_height*CGFloat(i)
            }
        }
    }
}