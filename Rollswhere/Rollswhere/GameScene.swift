import SpriteKit

extension GameScene {
    static func createBall(radius: CGFloat) -> SKShapeNode {
        let b = SKShapeNode(circleOfRadius: radius)
        b.fillColor = .blue
        b.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        return b
    }
}

class GameScene: SKScene {
    let ball = createBall(radius: 50)
    var power: CGFloat = 0
}

extension GameScene {
    override func didMove(to view: SKView) {
        anchorPoint = .init(x: 0.5, y: 0.5)
        
        size = UIScreen.main.bounds.size
        scaleMode = .aspectFill
        
        addChild(ball)
        
        backgroundColor = .brown
    }
}

extension GameScene {
    func evaluate(_ touch: UITouch) {
        let loc = touch.location(in: self)
        power = hypot(loc.x - ball.position.x, loc.y - ball.position.y)
    }
}

extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            print(touch.location(in: self))
            print("_______________\n")
            evaluate(touch)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        ball.physicsBody?.velocity.dx = power
    }
}
