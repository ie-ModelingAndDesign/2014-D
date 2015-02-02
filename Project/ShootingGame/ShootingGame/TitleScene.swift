import SpriteKit

class TitleScene: SKScene {
    
    var delegate_escape: SceneEscapeProtocol?
    var delegate_game: StartGameProtocol?
    private var beganPos: CGPoint!
    
    override func didMoveToView(view: SKView) {
        
        let myLabel = SKLabelNode(fontNamed:"Copperplate")
        myLabel.text = "Score";
        myLabel.fontColor = UIColor.blackColor()
        myLabel.fontSize = 36;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y: 200);
        self.addChild(myLabel)
        
        let startLabel = SKLabelNode(fontNamed: "Copperplate")
        startLabel.text = "Start"
        startLabel.fontColor = UIColor.blackColor()
        startLabel.fontSize = 40
        startLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        self.addChild(startLabel)
        
        
        var button1 = SKSpriteNode(
            color: UIColor.whiteColor(),
            size: CGSizeMake(200, 40)
        )
        button1.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame)+10)
        self.addChild(button1)
        
        var button2 = SKSpriteNode(
            color: UIColor.whiteColor(),
            size: CGSizeMake(200, 40)
        )
        button2.position = CGPoint(x: CGRectGetMidX(self.frame), y: 210)
        self.addChild(button2)
        
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        let touch: AnyObject! = touches.anyObject()
        beganPos = touch.locationInNode(self)
        
        if(
            beganPos.x < CGRectGetMidX(self.frame)+100
                && beganPos.x > CGRectGetMidX(self.frame)-100
                && beganPos.y < 230
                && beganPos.y > 190
            ){
                delegate_escape!.sceneEscape(self)
        }else if(
            beganPos.x < CGRectGetMidX(self.frame)+100
                && beganPos.x > CGRectGetMidX(self.frame)-100
                && beganPos.y < CGRectGetMidY(self.frame)+30
                && beganPos.y > CGRectGetMidY(self.frame)-10
            ){
                delegate_game!.startGame(self)
        }
        
    }
}