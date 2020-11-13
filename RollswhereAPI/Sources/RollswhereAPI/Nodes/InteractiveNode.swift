public class InteractiveNode: SKSpriteNode {
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        physicsBody?.categoryBitMask = interactiveObjects
    }
    
    public func tapped(gestureRecognizer: UITapGestureRecognizer) {
    }
    
    public func panned(gestureRecognizer: UIPanGestureRecognizer) {
    }
    
}
