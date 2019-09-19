import SpriteKit
import PlaygroundSupport
import GameplayKit


class GameState: GKState {
    
    var scene: GameScene? {
        game.currentScene
    }
    
    func panGestureHandler(gestureRecognizer: NSPanGestureRecognizer) {
    }
    
    func keyDown(event: NSEvent) {
    }
    
}

class EnterLevelState: GameState {
    
    override func didEnter(from previousState: GKState?) {
        print("Entering level")
        game.runLevel()
        stateMachine?.enter(RetryState.self)
    }
    
}

class RetryState: GameState {
    
    override func didEnter(from previousState: GKState?) {
        if let previousState = previousState {
            if previousState is EnterLevelState {
                print("Ball getting ready to shoot")
            } else {
                print("Retrying attempt")
            }
        }
        
        game.currentScene?.returnBalls()
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        for ball in game.balls {
            guard let ballBody = ball.component(ofType: PhysicsComponent.self)?.physicsBody else {
                continue
            }
            if !ballBody.isResting {
                return
            }
        }
        stateMachine?.enter(ReadyState.self)
    }
}

class ReadyState: GameState {
    
    override func didEnter(from previousState: GKState?) {
        for ball in game.balls {
            ball.component(ofType: PhysicsComponent.self)?.stopMovement()
            print("Ball is ready to shoot")
        }
    }
    
    override func panGestureHandler(gestureRecognizer: NSPanGestureRecognizer) {
        
    }
    
    override func keyDown(event: NSEvent) {
        switch event.keyCode {
        case 1: stateMachine?.enter(MovingState.self)
        default: break
        }
    }

}

class MovingState: GameState {
    
    override func didEnter(from previousState: GKState?) {
        for ball in game.balls {
            ball.component(ofType: Shootable.self)?.shoot()
        }
        print("Ball moving")
    }
    
    override func keyDown(event: NSEvent) {
        switch event.keyCode {
        case 15: stateMachine?.enter(RetryState.self)
        default: break
        }
    }

}

class GameComponent: GKComponent {
    
}

class Shootable: GameComponent {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init() {
        super.init()
    }
    
    var power: CGFloat = 0
    
    var entityPhysicsComponent: PhysicsComponent? {
        return entity?.component(ofType: PhysicsComponent.self)
    }

    func shoot() {
        entityPhysicsComponent?.setVelocity(.init(dx: 500, dy: 0))
        entityPhysicsComponent?.toggleGravity(on: true)
        print("Ball launched")
    }
    
}

class VisualComponent: GameComponent {
    
    var skNode: SKNode?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init() {
        super.init()
    }
    
    convenience init(skNode: SKNode) {
        self.init()
        self.skNode = skNode
    }
    
}

class PhysicsComponent: GameComponent {
    
    var physicsBody: SKPhysicsBody?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init() {
        super.init()
    }
    
    convenience init(physicsBody: SKPhysicsBody) {
        self.init()
        self.physicsBody = physicsBody
    }
    
    func stopMovement() {
        setVelocity(.init())
        setAngularVelocity(0)
        toggleGravity(on: false)
    }
    
    func toggleGravity(on: Bool) {
        physicsBody?.affectedByGravity = on
    }
    
    func setVelocity(_ v: CGVector) {
        physicsBody?.velocity = v
    }
    
    func setAngularVelocity(_ v: CGFloat) {
        physicsBody?.angularVelocity = v
    }
    
}

class GameObject: GKEntity {
    
}

class Ball: GameObject {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init() {
        super.init()
    }
    
    convenience init(node: BallNode) {
        self.init()
        addComponent(VisualComponent(skNode: node))
        addComponent(PhysicsComponent(physicsBody: node.body))
        addComponent(Shootable())
    }
    
}

class GameScene: SKScene {
    
    let sq1 = SKShapeNode(rect: .init(x: -15, y: -2.5, width: 50, height: 7))
    
    let sq2 = { () -> SKShapeNode in
        let n = SKShapeNode(rectOf: .init(width: 100, height: 10))
        n.fillColor = .brown
        n.physicsBody = SKPhysicsBody(edgeLoopFrom: n.frame)
        n.physicsBody?.isDynamic = false
        n.position.y = 0
        return n
    }()
    
    let ballNode = BallNode()
    
    override func didMove(to view: SKView) {
        anchorPoint = .init(x: 0.5, y: 0.5)
        scaleMode = .resizeFill
        
        backgroundColor = .brown
        sq1.position.y -= 50
        sq2.position.y += 50
        addChild(ballNode)
        addChild(sq2)
    }
    
    func returnBalls() {
        for ball in game.balls {
            ball.component(ofType: VisualComponent.self)?.skNode?.position = .init(x: 0, y: 200)
            ball.component(ofType: PhysicsComponent.self)?.setVelocity(.init())
            ball.component(ofType: PhysicsComponent.self)?.setAngularVelocity(0)
        }
    }
    
    var state: GameState? {
        return game.stateMachine.currentState as? GameState
    }
    
    override func keyDown(with event: NSEvent) {
        state?.keyDown(event: event)
    }
    
    func panGestureHandler(gestureRecognizer: NSPanGestureRecognizer) {
        print("Pan loc: \(gestureRecognizer.location(in: view))")
        state?.panGestureHandler(gestureRecognizer: gestureRecognizer)
    }
    
    override func update(_ currentTime: TimeInterval) {
        game.stateMachine.update(deltaTime: currentTime)
    }
    
}

class GameView: SKView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let pan = NSPanGestureRecognizer(target: self, action: #selector(panGestureHandler(gestureRecognizer:)))
        addGestureRecognizer(pan)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @IBAction func panGestureHandler(gestureRecognizer: NSPanGestureRecognizer) {
        game.currentScene?.panGestureHandler(gestureRecognizer: gestureRecognizer)
    }
    
}

class BallNode: SKShapeNode {
    
    var body: SKPhysicsBody = SKPhysicsBody()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
    }
    convenience init(physicsBody: SKPhysicsBody) {
        self.init()
        fillColor = .brown
        position.y = 300
        self.body = physicsBody
        self.physicsBody = body
        let n = SKShapeNode(circleOfRadius: 10)
        self.path = n.path
    }
    
}

extension Sequence {
    
    public func filter<T>(_ type: T.Type) -> [T] {
        return compactMap{ $0 as? T }
    }
}

protocol GameObjectCollectionProtocol {
    
    var balls: [Ball] { get }
    
}

struct Game: GameObjectCollectionProtocol {
    
    var balls: [Ball] {
        if let children = currentScene?.children {
            return children.filter(BallNode.self).map{ Ball(node: $0) }
        }
        return []
    }
    
    let stateMachine = GKStateMachine(states: [
        EnterLevelState(),
        RetryState(),
        ReadyState(),
        MovingState()
    ])
    
    let view = GameView(frame: .init(x: 0, y: 0, width: 500, height: 500))
    
    var currentScene: GameScene? {
        return view.scene as? GameScene
    }
    
    func start() {
        stateMachine.enter(EnterLevelState.self)
    }
    
    func runLevel() {
        view.presentScene(GameScene())
    }
    
}

let game = Game()

game.start()

PlaygroundPage.current.liveView = game.view
