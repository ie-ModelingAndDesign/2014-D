import Foundation
import SpriteKit

class AkihikoRoot{
    
    var myairobj : AkihikoAirframe!
    
    init(obj : SKScene){
        /* Setup */
        myairobj = AkihikoAirframe(obj:obj)
    }
    
    func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        myairobj.touchesBegan(touches, withEvent: event)
    }
    
    func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        myairobj.touchesMoved(touches, withEvent: event)
    }
    
    func update() {
        myairobj.update()
    }
    
    func touchesEnded(touches: NSSet, withEvent event: UIEvent){
        myairobj.touchesEnded(touches, withEvent: event)
    }
    
}