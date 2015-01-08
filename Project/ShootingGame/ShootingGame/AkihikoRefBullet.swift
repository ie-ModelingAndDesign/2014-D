import Foundation
import SpriteKit

class AkihikoRefBullet : Bullet {
    
    private var brobj: SKScene!
    private var bullet: SKSpriteNode!
    private var num: Int!
    private var refn: [Int] = [0,1]
    private var refspeed: [CGFloat] = [5,-5]
    private var action1 = SKAction.rotateByAngle(CGFloat(-45),duration:0.01)
    private var action2 = SKAction.rotateByAngle(CGFloat(45),duration:0.01)
    private var action3 = SKAction.rotateByAngle(CGFloat(-90),duration:0.01)
    private var action4 = SKAction.rotateByAngle(CGFloat(90),duration:0.01)
    
    
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
        
        if(bullet.position.x > 720 && refn[num] == 0){
            bullet.runAction(action4)
            num = 1
        }
        if(bullet.position.x <= 300 && refn[num] == 1){
            bullet.runAction(action3)
            num = 0
        }
        
    }
    
    
}