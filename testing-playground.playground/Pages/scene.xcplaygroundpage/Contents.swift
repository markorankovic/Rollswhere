import SpriteKit
import PlaygroundSupport

let view = SKView(
    frame: .init(
        x: 0,
        y: 0,
        width: 500,
        height: 500
    )
)

class GameScene: SKScene {
    
    let ball = { () -> SKShapeNode in
        let n = SKShapeNode(circleOfRadius: 10)
        n.fillColor = .brown
        return n
    }()
    
    override func didMove(to view: SKView) {
        backgroundColor = .blue
        addChild(ball)
    }
    
}

let scene = GameScene(size: view.frame.size)

scene.anchorPoint = .init(x: 0.5, y: 0.5)

view.presentScene(scene)

PlaygroundPage.current.liveView = view
