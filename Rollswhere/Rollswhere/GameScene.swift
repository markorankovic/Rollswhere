import SpriteKit

class GameScene: SKScene {
    
    let ballNode = BallNode()
    
    override func didMove(to view: SKView) {
        scaleMode = .resizeFill
        backgroundColor = .blue
        anchorPoint = .init(x: 0.5, y: 0.5)
        addChild(ballNode)
    }
    
}
