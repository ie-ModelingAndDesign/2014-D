import SpriteKit

class TitleScene: SKScene {
    
    var delegate_escape: SceneEscapeProtocol?
    var delegate_game: StartGameProtocol?
    private var beganPos: CGPoint!
    
    let start = UIButton()
    let scoreB = UIButton()
    
    override func didMoveToView(view: SKView) {
        
        let StartImage = UIImage(named: "start.png") as UIImage!
        start.frame = CGRectMake(0,0,250,50)
        start.layer.masksToBounds = true
        start.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        start.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        start.layer.cornerRadius = 20.0
        start.layer.position = CGPoint(x: self.view!.frame.width/2, y:250)
        start.setImage(StartImage, forState: .Normal)
        start.addTarget(self, action: "ClickStart:", forControlEvents: .TouchUpInside)
        self.view!.addSubview(start);
        
        let ScoreImage = UIImage(named: "score.png") as UIImage!
        scoreB.frame = CGRectMake(0,0,250,50)
        scoreB.layer.masksToBounds = true
        scoreB.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        scoreB.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        scoreB.layer.cornerRadius = 20.0
        scoreB.layer.position = CGPoint(x: self.view!.frame.width/2, y:400)
        scoreB.setImage(ScoreImage, forState: .Normal)
        scoreB.addTarget(self, action: "ClickScore:", forControlEvents: .TouchUpInside)
        self.view!.addSubview(scoreB);
        
        
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
            println("hoge")
            var zero:[Int] = Array(count: 10, repeatedValue: 0)
            defaults.setObject(zero, forKey:"NAME")
            defaults.synchronize()
        }
        


    }
    
    
    func ClickStart(sender : UIButton){

        scoreB.hidden = !scoreB.hidden
        start.hidden = !start.hidden
        delegate_game!.startGame(self)
        
    }
    
    func ClickScore(sender : UIButton){
        
        scoreB.hidden = !scoreB.hidden
        start.hidden = !start.hidden
        delegate_escape!.sceneEscape(self)
        
    }
    
}