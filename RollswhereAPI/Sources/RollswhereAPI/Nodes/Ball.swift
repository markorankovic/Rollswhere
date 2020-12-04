import Foundation

public class Ball: InteractiveNode {
        
    var power: CGFloat = 0
    let maxPower: CGFloat = 1
    let maxDist: CGFloat = 100
    
    var fullSpeed: CGFloat {
        return scene?.size.width ?? 0
    }
    
    var dragging: Bool = false
    
    var game: Game? {
        return ((scene?.view)?.findViewController() as? GameViewController)?.game
    }
    
    func configureSlideableSettings() {
//        guard let physicsBody = physicsBody else { return }
        
        // Slideable values
//        physicsBody.angularDamping
//        physicsBody.angularVelocity
//        physicsBody.friction
//        physicsBody.linearDamping
//        physicsBody.velocity
    }
    
    public override func panned(gestureRecognizer: UIPanGestureRecognizer) {
        childNode(withName: "powerBar")?.removeFromParent()
        
        guard let scene = scene else { return }
        let loc = scene.convertPoint(fromView: gestureRecognizer.location(in: scene.view))
        if gestureRecognizer.state == .began {
            guard gestureRecognizer.numberOfTouches == 1 else { return }
            print(scene.nodes(at: loc))
            guard scene.nodes(at: loc).first == self else { return }
            dragging = true
        }
        
        else if gestureRecognizer.state == .changed {
            guard dragging else { return }
            // Ball is being dragged
            let distanceToBall = hypot(loc.x - position.x, loc.y - position.y)
            let relevantDist = (distanceToBall - frame.width) < 0 ? 0 : (distanceToBall - frame.width)
            power = (fullSpeed * relevantDist) / maxDist
            power = power < fullSpeed ? power : fullSpeed
            renderPowerBar(relevantDist, gestureRecognizer.state)
        }
        
        else if gestureRecognizer.state == .ended {
            if dragging && power != 0 {
                physicsBody?.isDynamic = true
                physicsBody?.velocity.dx = power
                game?.enter(ShootingState.self)
            }
            dragging = false
        }
    }
    
    func renderPowerBar(_ relevantDist: CGFloat, _ state: UIGestureRecognizer.State) {
        let π = CGFloat.pi
        let π2 = 2 * π
        let limitedDist = relevantDist > maxDist ? maxDist : relevantDist
        let theta = ((limitedDist / maxDist) * π2)
        
        let circlePath = CGMutablePath()
        circlePath.addArc(
            center: .zero,
            radius: frame.width / 2,
            startAngle: π/2,
            endAngle: π/2 - theta,
            clockwise: true
        )
        
        let powerBar = SKShapeNode(path: circlePath)
        powerBar.name = "powerBar"
        
        addChild(powerBar)
    }
    
}
