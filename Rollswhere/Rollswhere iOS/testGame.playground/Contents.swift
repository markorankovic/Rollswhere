import PlaygroundSupport
import SpriteKit
import RollswhereAPI

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))

let vc = GameViewController()
vc.view = sceneView
vc.initializeForPlayground()

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
