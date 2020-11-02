public class Game: GKStateMachine {    
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
}
