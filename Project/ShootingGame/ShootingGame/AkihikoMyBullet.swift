import Foundation
import SpriteKit

class AkihikoMyBullet {
    
    var bobj: SKScene!
    var bulletPos: CGPoint!
    var bullet: SKSpriteNode!
    var bulArr: [SKSpriteNode!] = []
    var section: Int = 0
    var LaserWidth: CGFloat = 30
    var LaserHeight: CGFloat = 10
    var bwidth: CGFloat = 0
    
    
    init (obj: SKScene){
        bobj = obj
    }
    
    
    
    func CreateBullet(Pos: CGPoint, weapon: Int, Laser: CGFloat) {
        
        bulletPos = Pos
        LaserWidth = Laser
        section = weapon
        
        switch section {
        case 0:                 // bulletnum = 1
            BulletArr()
        case 1:                 // bulletnum = 3
            bwidth = -10
            BulletArr()
        case 2:                 // bulletnum = 5
            bwidth = -20
            BulletArr()
        case 3:                 // laser
            laser()
        default:
            BulletArr()         // bulletnum = 1
        }
        
    }
    
    
    
    /* 通常攻撃 */
    func BulletArr(){
        bulArr = [SKSpriteNode] ( count : 5 ,repeatedValue :
            SKSpriteNode(color: UIColor.yellowColor(),size: CGSizeMake(4, 10)) )
        
        
        for(var i=2-section;i<=2+section;i++){
            bulArr[i] = SKSpriteNode(color: UIColor.yellowColor(),size: CGSizeMake(4, 10))
            bulArr[i].position = CGPoint(x: bulletPos.x+bwidth, y: bulletPos.y)
            bobj.addChild(bulArr[i])
            bwidth += 10
        }
        bulletPos = bulArr[2].position
    }
    
    
    /* Laser */
    func laser(){
        bullet = SKSpriteNode(
            color: UIColor.yellowColor(),
            size: CGSizeMake(LaserWidth, LaserHeight)
        )
        
        bullet.position = CGPoint(x: bulletPos.x, y: bulletPos.y)
        bobj.addChild(bullet)
        bulletPos = bullet.position
        
    }
    
    
    
    func update(squarePos: CGPoint) {
        
        switch section {
            
        case 0,1,2:                 // 通常攻撃
            bulletPos = bulArr[2].position
            if(section == 2){
                bwidth = -20
            }else if(section == 1){
                bwidth = -10
            }else{
                bwidth = 0
            }
            for(var i=2-section;i<=2+section;i++){
                bulArr[i].position = CGPoint(x: bulletPos.x+bwidth, y: bulletPos.y+10)
                bwidth += 10
            }
            
        case 3:                     // Laser
            if(LaserWidth > 0){
                bullet.size = CGSizeMake(LaserWidth,LaserHeight)
                bullet.position = CGPoint(x: squarePos.x, y: squarePos.y+(LaserHeight/2))
                LaserHeight += 20
                LaserWidth -= 0.3
            }
            else{
                bullet.size = CGSizeMake(0,0)
            }
            
        default:                    // 通常攻撃(弾数1)
            bulletPos = bulArr[2].position
            bwidth = 0
            for(var i=2-section;i<section;i++){
                bulArr[i].position = CGPoint(x: bulletPos.x+bwidth, y: bulletPos.y+10)
                bwidth += 10
            }
            
        }
    }
    
}