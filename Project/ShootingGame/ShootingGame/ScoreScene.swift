import SpriteKit

class ScoreScene: SKScene {
    
    var delegate_escape: SceneEscapeProtocol?
    
    override func didMoveToView(view: SKView) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var score: [Int] = []
        
        if((defaults.objectForKey("NAME")) != nil){
            
            let objects = defaults.objectForKey("NAME") as? NSArray
            var scoreInt:Int
            for scoreInt in objects!{
                score.append(scoreInt as Int)
            }
        }
        
        var c : Int = score.count
        var rank:[Int] = Array(count: 10, repeatedValue: 0)

        for(var i=0;i<10;i++){
            rank[i] = score[0]
            for(var j=1;j<c;j++){
                if(rank[i]<score[j]){
                    rank[i] = score[j]
                }
            }
            for(var k=0;k<c;k++){
                if(rank[i] == score[k]){
                    score[k] = 0
                }
            }
            println(rank[i])
        }
        
        var pos:CGFloat = 0;
        for(var i=0;i<10;i++){
            let myLabel = Array(count: 10, repeatedValue:SKLabelNode(fontNamed:"Copperplate"))
            myLabel[i].text = rank[i].description;
            myLabel[i].fontColor = UIColor.whiteColor()
            myLabel[i].fontSize = 45;
            myLabel[i].position = CGPoint(x:CGRectGetMidX(self.frame), y: 540 - pos * 50);
            self.addChild(myLabel[i])
            pos++
        }
        
        
    }
    
    

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        delegate_escape!.sceneEscape(self)
        
    }

    func update() {

    }

}