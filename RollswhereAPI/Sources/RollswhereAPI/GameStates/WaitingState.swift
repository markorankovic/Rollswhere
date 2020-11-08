public class WaitingState: GKState {
    
    var scene: GameScene? {
        return (stateMachine as? Game)?.scene
    }
    
    public override func didEnter(from previousState: GKState?) {
        print("Entered WaitingState")
    }
    
    public override func panned(gestureRecognizer: UIPanGestureRecognizer) {
        for n in (scene?.children ?? []).compactMap({ $0 as? InteractiveNode }) {
            n.panned(gestureRecognizer: gestureRecognizer)
        }
    }
    
    public override func tapped(gestureRecognizer: UITapGestureRecognizer) {
        for n in (scene?.children ?? []).compactMap({ $0 as? InteractiveNode }) {
            n.tapped(gestureRecognizer: gestureRecognizer)
        }
    }
        
}
