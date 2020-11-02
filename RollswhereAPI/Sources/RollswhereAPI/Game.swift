public struct Game {
    public init() { }
}

extension Game: Requirements {
    public func exitKeys() -> Bool                      { false }
    public func interactiveMap() -> Bool                { false }
    public func mainMenu() -> Bool                      { false }
    public func levelSelection() -> Bool                { false }
    public func programmaticLevelConstruction() -> Bool { false }
    public func portals() -> Bool                       { false }
    public func breaking() -> Bool                      { false }
    public func iOSAndmacOSCompatibility() -> Bool      { false }
    public func togglePause() -> Bool                   { false }
    public func implementedLevelIdeas() -> Bool         { false }
    public func autoGameSaveAndLoad() -> Bool           { false }
    public func allSpecialsImplemented() -> Bool        { false }
    public func draggableAndRotatingItems() -> Bool     { false }
    public func startWithLevel() -> Bool                { false }
    public func shootBall() -> Bool                     { false }
    public func returnBall() -> Bool                    { false }
    public func nextLevel() -> Bool                     { false }
    public func returnToMainMenu() -> Bool              { false }
    public func shootHook() -> Bool                     { false }
    public func toggleActivateBall() -> Bool            { false }
    public func zoomFeatures() -> Bool                  { false }
    public func showPowerLevel() -> Bool                { false }
}
