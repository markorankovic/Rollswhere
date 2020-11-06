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
            power = (fullSpeed * distanceToBall) / maxDist
            power = power < fullSpeed ? power : fullSpeed
            renderPowerBar(distanceToBall, gestureRecognizer.state)
        }
        
        else if gestureRecognizer.state == .ended {
            guard dragging else { return }
            physicsBody?.velocity.dx = power
            dragging = false
            game?.enter(ShootingState.self)
        }
    }
    
    func renderPowerBar(_ distanceToBall: CGFloat, _ state: UIGestureRecognizer.State) {
        let π = CGFloat.pi
        let theta = (distanceToBall * (2 * π)) / maxDist
        
        let circlePath = CGMutablePath()
        circlePath.addArc(
            center: .zero,
            radius: frame.width / 2,
            startAngle: π / 4,
            endAngle: π / 4 + theta,
            clockwise: true
        )
        
        let powerBar = SKShapeNode(path: circlePath)
        powerBar.name = "powerBar"
        
        addChild(powerBar)
    }
    
}
