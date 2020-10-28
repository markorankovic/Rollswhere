import SpriteKit

extension GameScene {
    func createBall(radius: CGFloat) -> SKShapeNode {
        let b = SKShapeNode(circleOfRadius: radius)
        b.fillColor = .blue
        return b
    }
}

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        anchorPoint = .init(x: 0.5, y: 0.5)
        
        size = UIScreen.main.bounds.size
        scaleMode = .aspectFill
        
        let ball = createBall(radius: 50)
        addChild(ball)
        
        backgroundColor = .brown
    }
}
