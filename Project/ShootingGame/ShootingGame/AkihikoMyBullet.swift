import Foundation
import SpriteKit

class AkihikoMyBullet : Bullet {
    
    var bobj: SKScene!
    var bulletPos: CGPoint!             // 弾発射位置
    var bullet: SKSpriteNode!           // 弾の作成
    var section: Int = 0                // 武器番号
    var speed: CGFloat = 10             // 弾の早さ
    var LaserWidth: CGFloat = 30        // laserの幅
    var LaserHeight: CGFloat = 10       // laserの高さ
    var bwidth: CGFloat = 0             // 弾同士の間隔
    
    
    init (obj: SKScene,Pos: CGPoint, weapon: Int, Laser: CGFloat){
        super.init(obj: obj)
        section = weapon
        bobj = obj
        LaserWidth = Laser
        bulletPos = Pos
        
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
    override func update() {
        
        switch section {
            
        case 0:
            
            bullet.position = CGPoint(
                x: bullet.position.x,
                y: bullet.position.y+speed
            )
            position = bullet.position
            println(position)
        case 3:
            
            if(LaserWidth > 0){
                bullet.size = CGSizeMake(LaserWidth,LaserHeight)
                bullet.position = CGPoint(
                    x: bulletPos.x,
                    y: bulletPos.y+(LaserHeight/2)
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