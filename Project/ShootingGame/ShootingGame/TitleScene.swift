import SpriteKit
import AVFoundation

class TitleScene: SKScene{
    
    var delegate_escape: SceneEscapeProtocol?
    var delegate_game: StartGameProtocol?
    private var beganPos: CGPoint!
    
    let start = UIButton()
    let scoreB = UIButton()
    let musicB = UIButton()
    
    let StartImage = UIImage(named: "Start.jpg") as UIImage!
    let ScoreImage = UIImage(named: "Score.jpg") as UIImage!
    var MusicImage = UIImage(named: "dark.jpg") as UIImage!
    
    override func didMoveToView(view: SKView) {
        
        var Title = SKSpriteNode(imageNamed:"1minShooting_logo.png")
        Title.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)-150)
        self.addChild(Title)
        
        start.frame = CGRectMake(0,0,170,45)
        start.layer.masksToBounds = true
        start.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        start.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        start.layer.cornerRadius = 20.0
        start.layer.position = CGPoint(x: self.view!.frame.width/2, y:480)
        start.setImage(StartImage, forState: .Normal)
        start.addTarget(self, action: "ClickStart:", forControlEvents: .TouchUpInside)
        self.view!.addSubview(start);
        
        scoreB.frame = CGRectMake(0,0,170,45)
        scoreB.layer.masksToBounds = true
        scoreB.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        scoreB.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        scoreB.layer.cornerRadius = 20.0
        scoreB.layer.position = CGPoint(x: self.view!.frame.width/2, y:570)
        scoreB.setImage(ScoreImage, forState: .Normal)
        scoreB.addTarget(self, action: "ClickScore:", forControlEvents: .TouchUpInside)
        self.view!.addSubview(scoreB);
        
        
        /* スコアデータがなければスコアに0を挿入 */
        var score: [Int] = []
        let defaults = NSUserDefaults.standardUserDefaults()
        //defaults.removeObjectForKey("NAME")
        if((defaults.objectForKey("NAME")) != nil){
            
            let objects = defaults.objectForKey("NAME") as? NSArray
            var scoreInt:Int
            for scoreInt in objects!{
                score.append(scoreInt as Int)
            }
        }
        
        if(score.isEmpty){
            var zero:[Int] = Array(count: 10, repeatedValue: 0)
            defaults.setObject(zero, forKey:"NAME")
            defaults.synchronize()
        }
        
        SetMusicButton()
        
    }
    
    
    func ClickStart(sender : UIButton){
        
        scoreB.hidden = !scoreB.hidden
        start.hidden = !start.hidden
        musicB.hidden = !musicB.hidden
        delegate_game!.startGame(self)
        
    }
    
    func ClickScore(sender : UIButton){
        
        scoreB.hidden = !scoreB.hidden
        start.hidden = !start.hidden
        musicB.hidden = !musicB.hidden
        delegate_escape!.sceneEscape(self)
        
    }
    
    var Play = false
    func ClickMusic(sender : UIButton){
        musicB.hidden = !musicB.hidden
        
        let mySoundAction: SKAction = SKAction.playSoundFileNamed("music.mp3", waitForCompletion: true)
        if(Play == false){
            LifeManager.getInstance().setLife(2)
            musicB.hidden = !musicB.hidden
            MusicImage = UIImage(named: "dark.jpg") as UIImage!
            SetMusicButton()
            //runAction(SKAction.repeatActionForever(mySoundAction),withKey: "sound")
            Play = true
        }else if(Play == true){
            LifeManager.getInstance().setLife(3)
            musicB.hidden = !musicB.hidden
            MusicImage = UIImage(named: "dark.jpg") as UIImage!
            SetMusicButton()
            removeActionForKey("sound")
            Play = false
        }
    }
    
    func SetMusicButton(){
        musicB.frame = CGRectMake(0,0,50,50)
        musicB.layer.masksToBounds = true
        musicB.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        musicB.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        musicB.layer.cornerRadius = 20.0
        musicB.layer.position = CGPoint(x: self.view!.frame.width - 30, y: 200)
        musicB.setImage(MusicImage, forState: .Normal)
        musicB.addTarget(self, action: "ClickMusic:", forControlEvents: .TouchUpInside)
        self.view!.addSubview(musicB);
    }
    
    
}