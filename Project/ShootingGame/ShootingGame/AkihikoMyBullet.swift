import Foundation
import SpriteKit

class AkihikoMyBullet {
    
    var bobj: SKScene!
    var bulletPos: CGPoint!             // 弾発射位置
    var bullet: SKSpriteNode!           // 弾の作成
    var section: Int = 0                // 武器番号
    var speed: CGFloat = 10             // 弾の早さ
    var LaserWidth: CGFloat = 30        // laserの幅
    var LaserHeight: CGFloat = 10       // laserの高さ
    var bwidth: CGFloat = 0             // 弾同士の間隔
    
    
    init (obj: SKScene,Pos: CGPoint, weapon: Int, Laser: CGFloat){
        section = weapon
        bobj = obj
        LaserWidth = Laser
        
        switch section {
        case 0:
            bullet = SKSpriteNode(color: UIColor.yellowColor(),size: CGSizeMake(4, 10))
            bullet.position = CGPoint(x: Pos.x+bwidth, y: Pos.y)
            bobj.addChild(bullet)

        case 3:
            bullet = SKSpriteNode(color: UIColor.yellowColor(),
                size: CGSizeMake(Laser, LaserHeight)
            )
            bullet.position = CGPoint(x: Pos.x, y: Pos.y)
            bobj.addChild(bullet)
        default:
            println()
        }
        
    }
    

    
    
    /* update */
    func update(squarePos: CGPoint) {
        
        switch section {
            
        case 0:
            
            bullet.position = CGPoint(
                x: bullet.position.x,
                y: bullet.position.y+speed
            )
            
        case 3:
            
            if(LaserWidth > 0){
                bullet.size = CGSizeMake(LaserWidth,LaserHeight)
                bullet.position = CGPoint(
                    x: squarePos.x,
                    y: squarePos.y+(LaserHeight/2)
                )
                LaserHeight += 20
                LaserWidth -= 0.5
            }
            else{
                bullet.size = CGSizeMake(0,0)
            }

        default:
            println()
        }
        
        
    }
    
}