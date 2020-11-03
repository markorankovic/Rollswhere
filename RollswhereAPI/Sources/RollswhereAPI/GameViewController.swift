import UIKit

class GameViewController: UIViewController {

    let game = Game()
    
    var skView: SKView {
        view as! SKView
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
        game.viewController = self
        
        skView.presentScene(GameScene(fileNamed: "LevelTemplate.sks"))
    }
    
    func tapped(gestureRecognizer: UITapGestureRecognizer) {
        ((view as! SKView).scene as? GameScene)?.tapped(gestureRecognizer: gestureRecognizer)
    }
    func pinched(gestureRecognizer: UIPinchGestureRecognizer) {
        ((view as! SKView).scene as? GameScene)?.pinched(gestureRecognizer: gestureRecognizer)
    }
    func panned(gestureRecognizer: UIPanGestureRecognizer) {
        ((view as! SKView).scene as? GameScene)?.panned(gestureRecognizer: gestureRecognizer)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

