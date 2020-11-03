public class ReturningState: GKState {
    public override func didEnter(from previousState: GKState?) {
        (stateMachine as? Game)?.returnBall()
    }
    public override func update(_ currentTime: TimeInterval) {
        (stateMachine as? Game)?.ballReadyIfRested()
    }
}
