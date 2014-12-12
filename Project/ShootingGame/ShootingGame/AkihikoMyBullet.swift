import Foundation
import SpriteKit

class AkihikoMyBullet {
    
    var bobj: SKScene!
    var bulletPos: CGPoint!             // 弾発射位置
    var bullet: [SKSpriteNode!] = []    // 弾の作成
    var section: Int = 0                // 武器番号
    var speed: CGFloat = 10             // 弾の早さ
    var LaserWidth: CGFloat = 30        // laserの幅
    var LaserHight: CGFloat = 10        // laserの高さ
    var bwidth: CGFloat = 0             // 弾同士の間隔
    
    
    init (obj: SKScene){
        bobj = obj
    }
    
    
    
    func CreateBullet(Pos: CGPoint, weapon: Int, Laser: CGFloat) {
        
        bulletPos = Pos
        LaserWidth = Laser
        section = weapon
        
        /* 弾の作成 */
        bullet = [SKSpriteNode] (
            count : 5 ,
            repeatedValue :SKSpriteNode(color: UIColor.yellowColor(),size: CGSizeMake(4, 10))
        )
        
        
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
        case 4:
            BulletRef()         // Reflect
        default:
            BulletArr()         // bulletnum = 1
        }
        
    }
    
    
    
    /* 通常攻撃 */
    func BulletArr(){
        
        for(var i=2-section;i<=2+section;i++){
            bullet[i] = SKSpriteNode(color: UIColor.yellowColor(),size: CGSizeMake(4, 10))
            bullet[i].position = CGPoint(x: bulletPos.x+bwidth, y: bulletPos.y)
            bobj.addChild(bullet[i])
            bwidth += 10
        }
    }
    
    
    /* Laser攻撃 */
    func laser(){
        
        bullet[2].position = CGPoint(x: bulletPos.x, y: bulletPos.y)
        bobj.addChild(bullet[2])
        
    }
    
    
    /* Riflect攻撃 */
    func BulletRef(){
        
    }
    
    
    
    /* update */
    func update(squarePos: CGPoint) {
        
        switch section {
            
        case 0,1,2:                 // 通常攻撃
            for(var i=2-section;i<=2+section;i++){
                bullet[i].position = CGPoint(
                    x: bullet[i].position.x,
                    y: bullet[i].position.y+speed
                )
            }
            
        case 3:                     // Laser
            if(LaserWidth > 0){
                bullet[2].size = CGSizeMake(LaserWidth,LaserHight)
                bullet[2].position = CGPoint(
                    x: squarePos.x,
                    y: squarePos.y+(LaserHight/2)
                )
                LaserHight += 20
                LaserWidth -= 0.3
            }
            else{
                bullet[2].size = CGSizeMake(0,0)
            }
            
        default:
            println()
        }
    }
    
}