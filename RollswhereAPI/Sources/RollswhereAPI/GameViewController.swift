import UIKit

//extension SKView {
//    func presentScene(_ game: Game, _ scene: GameScene?) {
//        game.enter(ReturningState.self)
//        presentScene(scene)
//    }
//}

public class GameViewController: UIViewController {

    let game = Game()
    
    var skView: SKView {
        view as! SKView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        print(5)
        game.viewController = self
        addGestureRecognizers()
        game.enterLevel()
    }
    
    public func initializeForPlayground() {
        print(5)
        game.viewController = self
        addGestureRecognizers()
        game.enterLevel()
    }
    
    func addGestureRecognizers() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped(gestureRecognizer:)))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinched(gestureRecognizer:)))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panned(gestureRecognizer:)))
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(gestureRecognizer:)))
        skView.addGestureRecognizer(tap)
        skView.addGestureRecognizer(pinch)
        skView.addGestureRecognizer(pan)
        skView.addGestureRecognizer(longPress)
    }
    
    @objc func tapped(gestureRecognizer: UITapGestureRecognizer) {
        ((view as! SKView).scene as? GameScene)?.tapped(gestureRecognizer: gestureRecognizer)
    }
    @objc func pinched(gestureRecognizer: UIPinchGestureRecognizer) {
        ((view as! SKView).scene as? GameScene)?.pinched(gestureRecognizer: gestureRecognizer)
    }
    @objc func panned(gestureRecognizer: UIPanGestureRecognizer) {
        ((view as! SKView).scene as? GameScene)?.panned(gestureRecognizer: gestureRecognizer)
    }
    @objc func longPressed(gestureRecognizer: UILongPressGestureRecognizer) {
        ((view as! SKView).scene as? GameScene)?.longPressed(gestureRecognizer: gestureRecognizer)
    }

    public override var shouldAutorotate: Bool {
        return true
    }

    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    public override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
