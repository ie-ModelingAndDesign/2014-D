import Foundation
import SpriteKit

class AkihikoAirframe : Ship {
    
    private var sceneobj: SKScene!
    private var bframe: Int = 1         // 前回タップ時
    private var nframe: Int = 0         // 今回タップ時
    private var square: SKSpriteNode!   // 機体
    private var startPos: CGPoint!      // 初期位置
    private var beganPos: CGPoint!      // タップした位置
    private var diffPos: CGPoint!       // 移動距離
    private var lastPos: CGPoint!       // タップしたときの機体の位置
    
    private var shot_interval = 5       // 発射間隔
    private var weapon: Int = 1          // 現在の武器の値(これで武器チェンジ)
    private var BeforeWeapon: Int = 1       // Laser攻撃する前の武器を保存
    private var width: CGFloat = 0       // 複数発射時の弾同士の間隔
    private var Laser: CGFloat = 30      // Laser攻撃のときの弾の幅
    private var RefOn: Int = 0           // Reflect攻撃をON/OFF
    private var beam: Int = 10;
    private var texture_time = 0        // テクスチャの変更時間
    private var texture_right = false   // 飛行機の方向
    
    var laserbullet: Bullet!
    var bullet: Bullet!
    
    override init(obj: SKScene) {
        super.init(obj: obj)
        sceneobj = obj

        /* 機体の作成 */
        square = SKSpriteNode(imageNamed:"airplane_center.png")
        square.position = CGPoint(x: CGRectGetMidX(obj.frame), y: CGRectGetMinY(obj.frame)+50)
        square.xScale *= 0.2
        square.yScale *= 0.2
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
        if(bframe - nframe < 15 && weapon != 2 && beam > 0 ){
            BeforeWeapon = weapon
            weapon = 2
            laserbullet = AkihikoMyBullet(
                    obj:sceneobj,Pos:square.position,weapon: weapon,Laser: Laser,width: width
                )
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

    
    override func update() {
        super.update()
        /* laser */
        if(weapon == 2){
            Laser -= 0.3
            if(Laser <= 5){
                weapon = BeforeWeapon
                beam -= 1
                Laser = 30
            }
        }
            
        /* 通常 の 攻撃 */
        else{
            if(bframe%shot_interval == 0){
                if(weapon == 1){
                    width = 0
                }else if(weapon == 3){
                    width = -10
                }else if(weapon == 5){
                    width = -20
                }
                
                for(var i=0;i<weapon;i++){
                    bullet = AkihikoMyBullet(obj:sceneobj,
                            Pos:square.position,weapon: weapon,Laser: Laser,width:width
                        )
                    bullet.setTexture("pen_small")
                    width += 10
                }
            }
            
        }

        
        /* reflect */
        if(RefOn == 1 && bframe%120 == 0){
            bullet = AkihikoRefBullet(
                    obj:sceneobj, Pos:square.position, number: 0
                )
                       bullet = AkihikoRefBullet(
                    obj:sceneobj, Pos:square.position, number: 1
                )
        }
        
        if(CGFloat.abs(lastPos.x-square.position.x) > 5){
            texture_time = 15
            if(lastPos.x < square.position.x){
                square.texture = SKTexture(imageNamed:"airplane_right")
            }else if(lastPos.x > square.position.x){
                square.texture = SKTexture(imageNamed:"airplane_left")
            }
        }
        texture_time -= 1
        if(texture_time < 0){
            texture_time = 0
            square.texture = SKTexture(imageNamed:"airplane_center")
        }
        lastPos = square.position
        position = square.position
        bframe += 1
    }
 
    
    func levelup(){
        if(weapon < 5){
            
            if(weapon == 2){
                weapon = BeforeWeapon
                if(BeforeWeapon < 5){
                    weapon += 2
                }
            }else{
                weapon += 2
            }
            
        }
    }
    
    
    func Reflect(){
        RefOn = 1
    }
    
    
    func LaserBeam(){
        beam += 1
    }
    
    override func Destroy() {
        square.xScale = 0.0
        square.yScale = 0.0
        print("Destroy!!!\n")
        super.Destroy()
    }
}


