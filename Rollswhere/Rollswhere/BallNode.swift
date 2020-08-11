import SpriteKit

class BallNode: SKNode {
    
    override init() {
        super.init()
        let ellipse = SKShapeNode(circleOfRadius: 10)
        ellipse.fillColor = .yellow
        addChild(ellipse)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
