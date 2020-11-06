import SpriteKit

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}

open class GameScene: SKScene {
        
    var currentState: GKState? {
        return (view?.findViewController() as? GameViewController)?.game.currentState
    }
    
    open override func didMove(to view: SKView) {
        size = .init(width: 1366, height: 1024)
        print("Screen size: \(UIScreen.main.bounds.size)")
        print("View size: \(view.bounds.size)")
        print("Scene size: \(size)")
        scaleMode = .aspectFill
    }
    
    func returnBall() {
        let ball = childNode(withName: "ball") as! Ball
        ball.physicsBody?.velocity = .zero
        ball.physicsBody?.angularVelocity = 0
        ball.zRotation = 0
        let entryPipe = childNode(withName: "entryPipe")!
        let spawnPoint = entryPipe.childNode(withName: "spawnPoint")!
        ball.position = .init(
            x: entryPipe.position.x + spawnPoint.position.x,
            y: entryPipe.position.y + spawnPoint.position.y
        )
    }
    
    open override func update(_ currentTime: TimeInterval) {
        currentState?.update(currentTime)
    }
    
    public func tapped(gestureRecognizer: UITapGestureRecognizer) {
        currentState?.tapped(gestureRecognizer: gestureRecognizer)
    }
    
    public func pinched(gestureRecognizer: UIPinchGestureRecognizer) {
        currentState?.pinched(gestureRecognizer: gestureRecognizer)
    }
    
    public func panned(gestureRecognizer: UIPanGestureRecognizer) {
        currentState?.panned(gestureRecognizer: gestureRecognizer)
    }
    
}
