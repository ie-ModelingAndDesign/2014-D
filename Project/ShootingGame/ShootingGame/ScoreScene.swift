import SpriteKit

class ScoreScene: SKScene {
    
    var delegate_escape: SceneEscapeProtocol?
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "スコア確認";
        myLabel.fontSize = 40;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
    }
    
    // タップしたら、sceneEscapeを呼ぶようにする。
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        delegate_escape!.sceneEscape(self)
        
    }
}