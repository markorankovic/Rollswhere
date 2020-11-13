let fixedObjects: UInt32 = 1
let interactiveObjects: UInt32 = 2

extension GKState {
    var scene: GameScene? {
        return (stateMachine as? Game)?.scene
    }
    
}

public class WaitingState: GKState {
        
    public override func didEnter(from previousState: GKState?) {
        print("Entered WaitingState")
        let ball = scene?.childNode(withName: "ball") as! Ball
        ball.physicsBody?.collisionBitMask = fixedObjects
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
