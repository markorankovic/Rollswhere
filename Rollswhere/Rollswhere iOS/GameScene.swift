import SpriteKit
import RollswhereAPI

class GameScene: GameScene {
    func tapped(gestureRecognizer: UITapGestureRecognizer, game: Game) {
        game.currentState?.tapped(gestureRecognizer: gestureRecognizer, game: game)
    }
    
    func pinched(gestureRecognizer: UIPinchGestureRecognizer, game: Game) {
        game.currentState?.pinched(gestureRecognizer: gestureRecognizer, game: game)
    }
    
    func panned(gestureRecognizer: UIPanGestureRecognizer, game: Game) {
        game.currentState?.panned(gestureRecognizer: gestureRecognizer, game: game)
    }
}
