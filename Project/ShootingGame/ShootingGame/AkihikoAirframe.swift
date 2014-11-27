import Foundation
import SpriteKit

class AkihikoAirframe {
    
    var nframe: Int = 0
    var rframe: Int = 0
    var square: SKSpriteNode!
    var startPos: CGPoint!
    var beganPos: CGPoint!
    var diffPos: CGPoint!
    var lastPos: CGPoint!
    
    var sceneobj: SKScene!
    
    init(obj: SKScene) {
        sceneobj = obj
        
        square = SKSpriteNode(imageNamed:"Spaceship.png")
        
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMinY(obj.frame)+50)
        
        obj.addChild(square)
        
        startPos = CGPointMake(
            square.position.x,
            square.position.y
        )
        
        diffPos = CGPointMake(0,0)
        
        lastPos = square.position
        
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        let touch: AnyObject! = touches.anyObject()
        beganPos = touch.locationInNode(sceneobj)
        
        if(nframe - rframe < 15){
            square.position = CGPointMake(
                startPos.x,
                startPos.y
            )
        }
        
        rframe = nframe
    }
    
    func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        
        var touch: AnyObject! = touches.anyObject()
        var movedPos:CGPoint = touch.locationInNode(sceneobj)
        
        if(lastPos.x>=(beganPos.x+diffPos.x-50)
            && lastPos.x<=(beganPos.x+diffPos.x+50)
            && lastPos.y>=(beganPos.y+diffPos.y-50)
            && lastPos.y<=(beganPos.y+diffPos.y+50)
            ){
                
                diffPos = CGPointMake(
                    movedPos.x - beganPos.x,
                    movedPos.y - beganPos.y
                )
                
                square.position = CGPointMake(
                    beganPos.x + diffPos.x,
                    beganPos.y + diffPos.y
                )
        }
        
    }
    
    func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        diffPos = CGPointMake(0,0)
        
    }
    
    
    func update() {
        lastPos = square.position
        nframe += 1
    }
}