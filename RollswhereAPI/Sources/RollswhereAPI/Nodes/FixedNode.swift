public class FixedNode: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        physicsBody?.categoryBitMask = fixedObjects
    }

}
