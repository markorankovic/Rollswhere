public protocol Level { }

public protocol RollswhereAPIProtocolRequirements {
    func startWithLevel() -> Bool
    func shootBall() -> Bool
    func returnBall() -> Bool
    func nextLevel() -> Bool
    func returnToMainMenu() -> Bool
    func shootHook() -> Bool
    func toggleActivateBall() -> Bool
    func zoomFeatures() -> Bool
    func showPowerLevel() -> Bool
}
