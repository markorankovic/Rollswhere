public class MoveableBlock: InteractiveNode {
    var skView: SKView? {
        return scene?.view
    }
    
    var active = false
    var rotation = false
    
    private func touched(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let loc = scene?.convertPoint(fromView: gestureRecognizer.location(in: skView)) {
            return scene?.nodes(at: loc).contains(self) ?? false
        }
        return false
    }
    
    public override func tapped(gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            if touched(gestureRecognizer) && gestureRecognizer.numberOfTouches == 1 {
                rotation = !rotation
            }
        }
    }
    
    public override func panned(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .changed {
            guard active else { return }
            if rotation {
                rotation(gestureRecognizer)
            } else {
                drag(gestureRecognizer)
            }
        } else if gestureRecognizer.state == .ended {
            active = false
        } else if gestureRecognizer.state == .began {
            if touched(gestureRecognizer) {
                active = true
            }
        }
    }
    
    private func rotation(_ gestureRecognizer: UIPanGestureRecognizer) {
        let dx = gestureRecognizer.velocity(in: skView).x * 0.0003
        zRotation += dx
    }
    
    private func drag(_ gestureRecognizer: UIPanGestureRecognizer) {
        let dx = gestureRecognizer.velocity(in: skView).x * 0.03
        let dy = -gestureRecognizer.velocity(in: skView).y * 0.03
        position.x += dx
        position.y += dy
    }
}
