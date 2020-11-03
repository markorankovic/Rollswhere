import UIKit
import RollswhereAPI

class GameViewController: UIViewController {

    let game = Game()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        game.viewController = self
    }
    
    func tapped(gestureRecognizer: UITapGestureRecognizer) {
        ((view as! SKView).scene as? GameScene)?.tapped(gestureRecognizer: gestureRecognizer, game: game)
    }
    func pinched(gestureRecognizer: UIPinchGestureRecognizer) {
        ((view as! SKView).scene as? GameScene)?.pinched(gestureRecognizer: gestureRecognizer, game: game)
    }
    func panned(gestureRecognizer: UIPanGestureRecognizer) {
        ((view as! SKView).scene as? GameScene)?.panned(gestureRecognizer: gestureRecognizer, game: game)
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
