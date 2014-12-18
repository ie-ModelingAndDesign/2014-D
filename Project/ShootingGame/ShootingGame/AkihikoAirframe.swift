import Foundation
import SpriteKit


//hogehogehoge

class AkihikoAirframe {
    
    var bframe: Int = 1         // 前回タップ時
    var nframe: Int = 0         // 今回タップ時
    var square: SKSpriteNode!   // 機体
    var startPos: CGPoint!      // 初期位置
    var beganPos: CGPoint!      // タップした位置
    var diffPos: CGPoint!       // 移動距離
    var lastPos: CGPoint!       // タップしたときの機体の位置
    
    var sceneobj: SKScene!
    var bobj : [AkihikoMyBullet!] = []   // 空の配列
    var numObjects: Int = 5000    // 作る弾の個数
    var bnum: Int = 0             // 現在作成された弾の個数
    var weapon: Int = 0           // 現在の武器の値(これで武器チェンジ)
    var befweapon: Int = 0
    
    var Laser: CGFloat = 30       // Laser攻撃のときの弾の幅
    var Ref: Int = 0
    var brobj: [AkihikoRefBullet!] = []
    var brnum: Int = 0
    
    init(obj: SKScene) {
        
        bobj = [ AkihikoMyBullet ] ( count : numObjects , repeatedValue : AkihikoMyBullet(obj:obj) )
        brobj = [ AkihikoRefBullet ] ( count : numObjects , repeatedValue : AkihikoRefBullet(obj:obj) )
        
        for (var i=0;i<numObjects;i++) {
            bobj[i] = AkihikoMyBullet(obj:obj)
            brobj[i] = AkihikoRefBullet(obj:obj)
        }
        
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
            befweapon = weapon
            weapon = 3
            bobj[bnum].CreateBullet(square.position,weapon: weapon,Laser: Laser)
            bnum++
            Ref = 1
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
        
        /* weapon = 3　は レーザー */
        if(weapon == 3){
            for(var i=0;i<bnum;i++){
                bobj[i].update(square.position)
            }
            Laser -= 0.3
            if(Laser <= 5){
                weapon = 2
                Laser = 30
            }
        }
            
            
            /* 通常 の 攻撃 */
        else{
            if(bframe%20 == 0){
                bobj[bnum].CreateBullet(square.position,weapon: weapon,Laser: Laser)
                bnum++
            }
            for(var i=0;i<bnum;i++){
                bobj[i].update(square.position)
            }
        }
        
        
        /* Reflect攻撃 */
        if(Ref == 1 && bframe%120 == 0){
            brobj[brnum].CreateRefBullet(square.position,Ref: Ref)
            brnum++
        }
        for(var i=0; i<brnum;i++){
            brobj[i].update()
        }
        
        
        lastPos = square.position
        bframe += 1
        
    }
}


