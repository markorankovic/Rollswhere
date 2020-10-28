import SwiftUI
import SpriteKit

struct GameView: View {
    var body: some View {
        SpriteView(scene: GameScene())
            .ignoresSafeArea()
    }
}
