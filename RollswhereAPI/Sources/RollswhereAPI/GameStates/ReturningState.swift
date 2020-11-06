public class ReturningState: GKState {
    public override func didEnter(from previousState: GKState?) {
        print("Entered ReturningState")
    }
    public override func update(_ currentTime: TimeInterval) {
        (stateMachine as? Game)?.ballReadyIfRested()
    }
}
