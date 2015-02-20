import Foundation
import SpriteKit

class AkihikoRoot{
    
    var myairobj : AkihikoAirframe!
    var life : LifeView!
    init(obj : SKScene){
        /* Setup */
        myairobj = AkihikoAirframe(obj:obj)
        life = LifeView(obj: obj, ship: myairobj)
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        myairobj.touchesBegan(touches, withEvent: event)
    }
    
    func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        myairobj.touchesMoved(touches, withEvent: event)
    }
    
    func update() {
        myairobj.update()
        life.update()
    }
    
    func touchesEnded(touches: NSSet, withEvent event: UIEvent){
        myairobj.touchesEnded(touches, withEvent: event)
    }
    
}