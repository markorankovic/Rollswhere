public protocol Level { }

public protocol Requirements {
    func startWithLevel() -> Bool
    func shootBall() -> Bool
    func returnBall() -> Bool
    func nextLevel() -> Bool
    func returnToMainMenu() -> Bool
    func shootHook() -> Bool
    func toggleActivateBall() -> Bool
    func zoomFeatures() -> Bool
    func showPowerLevel() -> Bool
    func programmaticLevelConstruction() -> Bool
    func portals() -> Bool
    func breaking() -> Bool
    func iOSAndmacOSCompatibility() -> Bool
    func togglePause() -> Bool
    func implementedLevelIdeas() -> Bool
    func autoGameSaveAndLoad() -> Bool
    func allSpecialsImplemented() -> Bool
    func draggableAndRotatingItems() -> Bool
    func exitKeys() -> Bool
    func interactiveMap() -> Bool
    func mainMenu() -> Bool
    func levelSelection() -> Bool
}
