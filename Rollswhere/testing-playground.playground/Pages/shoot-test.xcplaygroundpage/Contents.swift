import SpriteKit
import PlaygroundSupport
import GameplayKit

class Game {
    
    let scene: GameScene
    
    init(scene: GameScene) {
        self.scene = scene
    }
    
}

class GameState: GKState {
    
    init(game: Game) {
        
    }
}

class ReadyState: GameState {
    
    override func didEnter(from previousState: GKState?) {
        
    }
    
}

class MovingState: GameState {
    
}

let stateMachine = GKStateMachine(states: [
    ReadyState.self,
    MovingState.self
    ])

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
    
    let ball = { () -> SKShapeNode in
        let r: CGFloat = 10
        let n = SKShapeNode(circleOfRadius: r)
        n.fillColor = .brown
        n.physicsBody = SKPhysicsBody(circleOfRadius: r)
        n.position.y = 300
        return n
    }()
    
    override func didMove(to view: SKView) {
        backgroundColor = .brown
        sq1.position.y -= 50
        sq2.position.y += 50
        addChild(ball)
        addChild(sq2)
    }
    
    func fireTheBall() {
        ball.physicsBody?.velocity.dx = 500
    }
    override func keyDown(with event: NSEvent) {
        print(event.keyCode)
        switch event.keyCode {
        case 1: fireTheBall()
        case 15: ball.physicsBody?.velocity = .init(); ball.physicsBody?.angularVelocity = .init(); ball.position = .init(x: 0, y: 300)
        default: break
        }
    }
    
}

let scene = { () -> GameScene in
    let s = GameScene()
    s.anchorPoint = .init(x: 0.5, y: 0.5)
    s.scaleMode = .resizeFill
    return s
}()

let game = Game(scene: scene)

let view = SKView(frame: .init(x: 0, y: 0, width: 500, height: 500))

view.presentScene(game.scene)

PlaygroundPage.current.liveView = view
