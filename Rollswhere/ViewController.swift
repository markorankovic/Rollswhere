import Cocoa
import GameplayKit
import RollswhereEngine

class ViewController: NSViewController {

    @IBOutlet var skView: GameView!
    
    override func viewDidLoad() {
                                
        let game = Game()
        skView.connectToGame(game)
        let level = GKScene(fileNamed: "MyScene")!
        print(level.entities.first?.components)
        game.runLevel(level)
                
    }
}

