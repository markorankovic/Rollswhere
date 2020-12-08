extension GKState {
    @objc public func tapped(gestureRecognizer: UITapGestureRecognizer) {
    }
    @objc public func pinched(gestureRecognizer: UIPinchGestureRecognizer) {
    }
    @objc public func panned(gestureRecognizer: UIPanGestureRecognizer) {
    }
    @objc public func longPressed(gestureRecognizer: UILongPressGestureRecognizer) {
    }
    @objc public func update(_ currentTime: TimeInterval) {
    }
}

public class Game: GKStateMachine {
    
    public weak var viewController: GameViewController?
    
    var view: SKView? {
        viewController?.skView
    }
    
    var scene: GameScene? {
        return view?.scene as? GameScene
    }
    
    var ball: Ball? {
        return scene?.children.filter{ $0 is Ball }.first as? Ball
    }
    
    public init() {
        super.init(
            states: [
                LaunchingState(),
                ReturningState(),
                WaitingState(),
                ShootingState(),
                MainMenuState()
            ]
        )
        enter(LaunchingState.self)
    }
    
    func enterLevel() {
        let scene = GameScene(fileNamed: "LevelTemplate.sks")
        view?.presentScene(scene)
        returnBall()
    }
    
    public func returnBall() {
        enter(ReturningState.self)
        scene?.returnBall()
    }
    
    public func ballReadyIfRested() {
        guard let ballBody = ball?.physicsBody else { return }
        DispatchQueue.main.async {
            if ballBody.resting && ballBody.allContactedBodies().count > 0 {
                print(ballBody.allContactedBodies())
                self.enter(WaitingState.self)
            }
        }
    }
        
}

extension SKPhysicsBody {
    var resting: Bool {
        let speed: CGFloat = 0.01
        return abs(velocity.dx) < speed && abs(velocity.dy) < speed
    }
}
