import Foundation
import SpriteKit

class AkihikoRefBullet : Bullet {
    
    var brobj: SKScene!
    var bullet: SKSpriteNode!
    var bulletPos: [SKSpriteNode!] = []
    var num: Int!
    var refn: [Int] = [0,1]
    var refspeed: [CGFloat] = [5,-5]
    var action1 = SKAction.rotateByAngle(CGFloat(-45),duration:0.01)
    var action2 = SKAction.rotateByAngle(CGFloat(45),duration:0.01)
    var action3 = SKAction.rotateByAngle(CGFloat(-90),duration:0.01)
    var action4 = SKAction.rotateByAngle(CGFloat(90),duration:0.01)
    
    
    init (obj: SKScene, Pos: CGPoint,number: Int){
        super.init(obj: obj)
        brobj = obj
        num = number
        
        bullet = SKSpriteNode(
            color: UIColor.yellowColor(),
            size: CGSizeMake(4, 10)
        )
        bullet.position = CGPoint(x: Pos.x, y: Pos.y)
        brobj.addChild(bullet)
        
        if(refn[num] == 0){
            bullet.runAction(action1)
        }else if(refn[num] == 1){
            bullet.runAction(action2)
        }
        
    }
    
    
    override func update(){
        
        bullet.position = CGPoint(
            x: bullet.position.x+refspeed[num],
            y: bullet.position.y+5
        )
        
        if(bullet.position.x > 600 && refn[num] == 0){
            bullet.runAction(action4)
            num = 1
        }
        if(bullet.position.x <= 400 && refn[num] == 1){
            bullet.runAction(action3)
            num = 0
        }
        
    }
    
    
}