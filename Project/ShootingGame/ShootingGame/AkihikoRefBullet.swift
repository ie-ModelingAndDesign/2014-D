import Foundation
import SpriteKit

class AkihikoRefBullet {
    
    var brobj: SKScene!
    var bullet: [SKSpriteNode!] = []
    var bulletPos: [SKSpriteNode!] = []
    var refOn: Int = 0
    var refn: [Int] = [0,1]
    var refspeed: [CGFloat] = [5,-5]
    var action1 = SKAction.rotateByAngle(CGFloat(-45),duration:0.01)
    var action2 = SKAction.rotateByAngle(CGFloat(45),duration:0.01)
    var action3 = SKAction.rotateByAngle(CGFloat(-90),duration:0.01)
    var action4 = SKAction.rotateByAngle(CGFloat(90),duration:0.01)
    
    
    init (obj: SKScene){
        brobj = obj
    }
    
    
    func CreateRefBullet(Pos: CGPoint, Ref: Int){
        refOn = Ref
        bullet = [SKSpriteNode] (
            count : 2 ,
            repeatedValue :SKSpriteNode(color: UIColor.yellowColor(),size: CGSizeMake(4, 10))
        )
        
        for(var i=0;i<=1;i++){
            bullet[i] = SKSpriteNode(color: UIColor.yellowColor(),size: CGSizeMake(4, 10))
            bullet[i].position = CGPoint(x: Pos.x, y: Pos.y)
            brobj.addChild(bullet[i])
        }
        bullet[0].runAction(action1)
        bullet[1].runAction(action2)
        
    }
    
    
    func update(){
        
        for(var i=0;i<=1;i++){
            bullet[i].position = CGPoint(
                x: bullet[i].position.x+refspeed[i],
                y: bullet[i].position.y+5
            )
            if(bullet[i].position.x > 700 && refn[i] == 0){
                bullet[i].runAction(action4)
                refspeed[i] *= -1
                refn[i] = 1
            }
            if(bullet[i].position.x < 400 && refn[i] == 1){
                bullet[i].runAction(action3)
                refspeed[i] *= -1
                refn[i] = 0
            }
        }
        
    }
    
    
}