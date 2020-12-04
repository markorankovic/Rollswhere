public class ShootingState: GKState {
    
    var braking: Bool = false
    
    public override func didEnter(from previousState: GKState?) {
        print("Entered ShootingState")
        let ball = scene?.childNode(withName: "ball") as! Ball
        braking = false
        ball.physicsBody!.angularDamping = 0.1
        ball.physicsBody?.collisionBitMask = fixedObjects|interactiveObjects
    }
    
    public override func tapped(gestureRecognizer: UITapGestureRecognizer) {
        (stateMachine as? Game)?.returnBall()
    }
    
    public override func longPressed(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            print(true)
            braking = true
        } else if gestureRecognizer.state == .ended {
            braking = false
            print(false)
        }
    }
    
    var ball: Ball { return scene?.childNode(withName: "ball") as! Ball }
    
    public override func update(_ currentTime: TimeInterval) {
        if braking {
            ball.physicsBody?.angularDamping += 1
        } else {
            ball.physicsBody?.angularDamping = 0.1
        }
        (stateMachine as? Game)?.ballReadyIfRested()
    }
    
}
