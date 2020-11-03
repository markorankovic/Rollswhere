extension GKState {
    @objc public func tapped(gestureRecognizer: UITapGestureRecognizer) {
    }
    @objc public func pinched(gestureRecognizer: UIPinchGestureRecognizer) {
    }
    @objc public func panned(gestureRecognizer: UIPanGestureRecognizer) {
    }
    @objc public func update(_ currentTime: TimeInterval) {
    }
}

public class Game: GKStateMachine {
    
    public weak var viewController: UIViewController?
    
    var scene: GameScene? {
        return (viewController?.view as? SKView)?.scene as? GameScene
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
        
    public func returnBall() {
        scene?.returnBall()
    }
    
    public func ballReadyIfRested() {
        guard let ballBody = ball?.physicsBody else { return }
        if ballBody.isResting {
            enter(WaitingState.self)
        }
    }
        
}
