import Hope
import RollswhereAPI

final class RequirementsTest: Hopes {
    let game = Game()
    func test_shootBall() {
        XCTAssert(game.shootBall())
    }
    func test_nextLevel() {
        XCTAssert(game.nextLevel())
    }
    func test_returnBall() {
        XCTAssert(game.returnBall())
    }
    func test_returnToMainMenu() {
        XCTAssert(game.returnToMainMenu())
    }
    func test_shootHook() {
        XCTAssert(game.shootHook())
    }
    func test_showPowerLevel() {
        XCTAssert(game.showPowerLevel())
    }
    func test_startWithLevel() {
        XCTAssert(game.startWithLevel())
    }
    func test_toggleActivateBall() {
        XCTAssert(game.toggleActivateBall())
    }
    func test_zoomFeatures() {
        XCTAssert(game.zoomFeatures())
    }
    func test_allSpecialsImplemented() {
        XCTAssert(game.allSpecialsImplemented())
    }
    func test_autoGameSaveAndLoad() {
        XCTAssert(game.autoGameSaveAndLoad())
    }
    func test_breaking() {
        XCTAssert(game.breaking())
    }
    func test_draggableAndRotatingItems() {
        XCTAssert(game.draggableAndRotatingItems())
    }
    func test_exitKeys() {
        XCTAssert(game.exitKeys())
    }
    func test_interactiveMap() {
        XCTAssert(game.interactiveMap())
    }
    func test_levelSelection() {
        XCTAssert(game.levelSelection())
    }
    func test_iOSAndmacOSCompatibility() {
        XCTAssert(game.iOSAndmacOSCompatibility())
    }
    func test_portals() {
        XCTAssert(game.portals())
    }
    func test_mainMenu() {
        XCTAssert(game.mainMenu())
    }
    func test_programmaticLevelConstruction() {
        XCTAssert(game.programmaticLevelConstruction())
    }
    func test_togglePause() {
        XCTAssert(game.togglePause())
    }
}
