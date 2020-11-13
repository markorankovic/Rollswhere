public class ShootingState: GKState {
        
    public override func didEnter(from previousState: GKState?) {
        print("Entered ShootingState")
        let ball = scene?.childNode(withName: "ball") as! Ball
        ball.physicsBody?.collisionBitMask = fixedObjects|interactiveObjects
    }
    
    public override func tapped(gestureRecognizer: UITapGestureRecognizer) {
        (stateMachine as? Game)?.returnBall()
    }
    
}
