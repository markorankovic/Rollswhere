public class ReturningState: GKState {
    public override func didEnter(from previousState: GKState?) {
        let ball = scene?.childNode(withName: "ball") as! Ball
        ball.physicsBody?.isDynamic = true
        print("Entered ReturningState")
    }
    public override func update(_ currentTime: TimeInterval) {
        (stateMachine as! Game).ballReadyIfRested()
    }
}
