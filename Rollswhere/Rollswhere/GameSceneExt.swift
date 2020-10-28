extension GameScene {
    static func createBall(radius: CGFloat) -> SKShapeNode {
        let b = SKShapeNode(circleOfRadius: radius)
        b.fillColor = .blue
        b.physicsBody = SKPhysicsBody(circleOfRadius: radius)
        return b
    }
}

extension GameScene {
    static func createPlatform() -> SKShapeNode {
        let s: CGSize = .init(width: 150, height: 20)
        let p = SKShapeNode(rectOf: s)
        let physB = SKPhysicsBody(rectangleOf: s)
        physB.isDynamic = false
        p.physicsBody = physB
        return p
    }
}

extension GameScene {
    override func didMove(to view: SKView) {
        anchorPoint = .init(x: 0.5, y: 0.5)
        
        size = UIScreen.main.bounds.size
        scaleMode = .aspectFill
        
        addChild(ball)
        platform.position.y -= 100
        addChild(platform)
        
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
        ball.position = .init()
        ball.physicsBody?.angularVelocity = 0
        ball.physicsBody?.velocity = .zero
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            //print(touch.location(in: self))
            //print("_______________\n")
            evaluate(touch)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        ball.physicsBody?.velocity.dx = power
    }
}

extension GameScene {
    func onTap(g: TapGesture) {
        print(1)
    }
    func onDrag(g: DragGesture) {
        print(2)
    }
}
