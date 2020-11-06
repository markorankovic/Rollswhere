public class ShootingState: GKState {
        
    public override func didEnter(from previousState: GKState?) {
        print("Entered ShootingState")
    }
    
    public override func tapped(gestureRecognizer: UITapGestureRecognizer) {
        (stateMachine as? Game)?.returnBall()
    }
    
}
