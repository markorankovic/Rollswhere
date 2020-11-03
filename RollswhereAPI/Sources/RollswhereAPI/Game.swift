public class Game: GKStateMachine {
    
    public weak var viewController: UIViewController?
    
    var scene: GameScene? {
        return (viewController?.view as? SKView)?.scene as? GameScene
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
        
}
