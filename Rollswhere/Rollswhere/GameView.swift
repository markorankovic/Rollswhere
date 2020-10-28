struct GameView: View {
    
    let scene = GameScene()
    
    var tap: some Gesture {
        let t = TapGesture()
        let l = t.
        return t.onEnded {
            scene.onTap()
        }
    }
    
    var body: some View {
        SpriteView(scene: scene)
            .ignoresSafeArea()
            .gesture(tap)
    }
    
}
