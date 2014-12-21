import Foundation
import SpriteKit

class AkihikoAirframe {
    
    var sceneobj: SKScene!
    var bframe: Int = 1         // 前回タップ時
    var nframe: Int = 0         // 今回タップ時
    var square: SKSpriteNode!   // 機体
    var startPos: CGPoint!      // 初期位置
    var beganPos: CGPoint!      // タップした位置
    var diffPos: CGPoint!       // 移動距離
    var lastPos: CGPoint!       // タップしたときの機体の位置
    
    var bobj : [AkihikoMyBullet!] = []
    var numObjects: Int = 5000   // 作る弾の個数
    var bnum: Int = 0            // 現在作成された弾の個数
    var weapon: Int = 1          // 現在の武器の値(これで武器チェンジ)
    var BeforeWeapon: Int!       // Laser攻撃する前の武器を保存
    var width: CGFloat = 0       // 複数発射時の弾同士の間隔
    var Laser: CGFloat = 30      // Laser攻撃のときの弾の幅
    
    var brobj: [AkihikoRefBullet!] = []
    var brnum: Int = 0           // Reflect弾の個数
    var RefOn: Int = 0           // Reflect攻撃をON/OFF
    
    
    
    init(obj: SKScene) {
        
        sceneobj = obj
        
        /* 機体の作成 */
        square = SKSpriteNode(imageNamed:"Spaceship.png")
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMinY(obj.frame)+50)
        obj.addChild(square)

        
        /* 初期位置を記録 */
        startPos = CGPointMake(
            square.position.x,
            square.position.y
        )
        
        /* 移動距離を初期化 */
        diffPos = CGPointMake(0,0)
        /* 最終位置を初期化 */
        lastPos = square.position
        
    }
    
    
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        
        /* タップした位置を取っておく */
        let touch: AnyObject! = touches.anyObject()
        beganPos = touch.locationInNode(sceneobj)
        
        /* ダブルタップしたときの処理 */
        if(bframe - nframe < 15){
            BeforeWeapon = weapon
            weapon = 2
            var bullet : Bullet = AkihikoMyBullet(
                    obj:sceneobj,Pos:square.position,weapon: weapon,Laser: Laser,width: width
                )
            bnum++
            RefOn = 1
        }
        nframe = bframe
        
    }
    
    
    func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        
        /* 指の位置を取っておく */
        var touch: AnyObject! = touches.anyObject()
        var movedPos:CGPoint = touch.locationInNode(sceneobj)
        
        
        /* タップした位置が機体の近くなら機体を動かす */
        if(lastPos.x>=(beganPos.x+diffPos.x-50)
            && lastPos.x<=(beganPos.x+diffPos.x+50)
            && lastPos.y>=(beganPos.y+diffPos.y-50)
            && lastPos.y<=(beganPos.y+diffPos.y+50)
            ){
                
                diffPos = CGPointMake(
                    movedPos.x - beganPos.x,
                    movedPos.y - beganPos.y
                )
                
                /* 機体を動かす */
                square.position = CGPointMake(
                    beganPos.x + diffPos.x,
                    beganPos.y + diffPos.y
                )
        }
        
    }
    
    
    
    func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        /* タップし終えたら移動距離を初期化 */
        diffPos = CGPointMake(0,0)
    }
    
    
    
    func update() {
        
        /* laser */
        if(weapon == 2){
            Laser -= 0.3
            if(Laser <= 5){
                weapon = 5
                Laser = 30
            }
        }
            
        /* 通常 の 攻撃 */
        else{
            if(bframe%20 == 0){
                if(weapon == 1){
                    width = 0
                }else if(weapon == 3){
                    width = -10
                }else if(weapon == 5){
                    width = -20
                }
                
                for(var i=0;i<weapon;i++){
                    var bullet : Bullet = AkihikoMyBullet(obj:sceneobj,
                            Pos:square.position,weapon: weapon,Laser: Laser,width:width
                        )
                    width += 10
                    bnum++
                }
            }
            
        }
        
        
        /* reflect */
        if(RefOn == 1 && bframe%120 == 0){
            var bullet1 : Bullet = AkihikoRefBullet(
                    obj:sceneobj, Pos:square.position, number: 0
                )
            brnum++
            var bullet2 : Bullet = AkihikoRefBullet(
                    obj:sceneobj, Pos:square.position, number: 1
                )
            brnum++
        }

        lastPos = square.position
        bframe += 1
        
    }
    
}


