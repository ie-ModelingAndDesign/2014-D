import Foundation
import SpriteKit

class AkihikoMyBullet : Bullet {
    
    private var bobj: SKScene!
    private var bulletPos: CGPoint!             // 弾発射位置
    private var bullet: SKSpriteNode!           // 弾の作成
    private var section: Int = 0                // 武器番号
    private var speed: CGFloat = 10             // 弾の早さ
    private var LaserWidth: CGFloat = 30        // laserの幅
    private var LaserHeight: CGFloat = 10       // laserの高さ
    private var bwidth: CGFloat!             // 弾同士の間隔
    
    var lasercollider : Beam!
    init (obj: SKScene,Pos: CGPoint, weapon: Int, Laser: CGFloat, width: CGFloat){
        
        super.init(obj: obj)
        section = weapon
        bobj = obj
        LaserWidth = Laser
        bulletPos = Pos
        bwidth = width
        
        switch section {
        case 1,3,5:
            bullet = SKSpriteNode(
                color: UIColor.yellowColor(),
                size: CGSizeMake(4, 10)
            )
            bullet.position = CGPoint(x: Pos.x+bwidth, y: Pos.y)
            bobj.addChild(bullet)

        case 2:
            bullet = SKSpriteNode(
                color: UIColor.yellowColor(),
                size: CGSizeMake(Laser, LaserHeight)
            )
            bullet.position = CGPoint(x: Pos.x, y: Pos.y)
            bobj.addChild(bullet)
            lasercollider = Beam(obj:obj)  // 当たり判定を作成
        default:
            println()
        }
        
    }
    
    

    
    
    /* update */
    override func update() {
        
        switch section {
            
        case 1,3,5:
            bullet.position = CGPoint(
                x: bullet.position.x,
                y: bullet.position.y+speed
            )
            position = bullet.position

        case 2:
            if(LaserWidth > 0){
                bullet.size = CGSizeMake(LaserWidth,LaserHeight)
                bullet.position = CGPoint(
                    x: bulletPos.x,
                    y: bulletPos.y+(LaserHeight/2)
                )
                LaserHeight += 20
                LaserWidth -= 0.5
                lasercollider.position = bullet.position
                lasercollider.colliderWidth = LaserWidth
                lasercollider.colliderHeight = LaserHeight
            }
            else{
                bullet.size = CGSizeMake(0,0)
                lasercollider.Destroy()
            }

        default:
            println()
        }
        
    }
    
}