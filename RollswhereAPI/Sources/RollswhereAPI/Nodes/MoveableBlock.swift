public class MoveableBlock: SKSpriteNode {
    var skView: SKView? {
        return scene?.view
    }
    public func panned(gestureRecognizer: UIPanGestureRecognizer) {
        let oneFinger = gestureRecognizer.numberOfTouches == 1
        guard oneFinger, let scene = scene else {
            return potentialRotation(gestureRecognizer)
        }
        let loc = gestureRecognizer.location(in: skView)
        if scene.nodes(at: loc).contains(self) {
            position = loc
        }
    }
    private func potentialRotation(_ gestureRecognizer: UIPanGestureRecognizer) {
        let twoFingers = gestureRecognizer.numberOfTouches == 2
        guard twoFingers, let scene = scene else {
            return
        }
    }
}
