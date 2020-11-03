import SpriteKit

public class GameScene: SKScene {
    
    func returnBall() {
        let ball = childNode(withName: "ball") as! SKShapeNode
        let entryPipe = childNode(withName: "entryPipe") as! SKShapeNode
        let spawnPoint = entryPipe.childNode(withName: "spawnPoint")!
        ball.position = spawnPoint.position
    }
    
}
