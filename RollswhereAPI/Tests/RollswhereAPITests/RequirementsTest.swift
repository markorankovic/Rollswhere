import Hope
import RollswhereAPI

final class RequirementsTest: Hopes {
    let tracker = GameRequirementsTracker()
    func test_shootBall() {
        XCTAssert(tracker.shootBall())
    }
    func test_nextLevel() {
        XCTAssert(tracker.nextLevel())
    }
    func test_returnBall() {
        XCTAssert(tracker.returnBall())
    }
    func test_returnToMainMenu() {
        XCTAssert(tracker.returnToMainMenu())
    }
    func test_shootHook() {
        XCTAssert(tracker.shootHook())
    }
    func test_showPowerLevel() {
        XCTAssert(tracker.showPowerLevel())
    }
    func test_startWithLevel() {
        XCTAssert(tracker.startWithLevel())
    }
    func test_toggleActivateBall() {
        XCTAssert(tracker.toggleActivateBall())
    }
    func test_zoomFeatures() {
        XCTAssert(tracker.zoomFeatures())
    }
    func test_allSpecialsImplemented() {
        XCTAssert(tracker.allSpecialsImplemented())
    }
    func test_autoGameSaveAndLoad() {
        XCTAssert(tracker.autoGameSaveAndLoad())
    }
    func test_breaking() {
        XCTAssert(tracker.breaking())
    }
    func test_draggableAndRotatingItems() {
        XCTAssert(tracker.draggableAndRotatingItems())
    }
    func test_exitKeys() {
        XCTAssert(tracker.exitKeys())
    }
    func test_interactiveMap() {
        XCTAssert(tracker.interactiveMap())
    }
    func test_levelSelection() {
        XCTAssert(tracker.levelSelection())
    }
    func test_iOSAndmacOSCompatibility() {
        XCTAssert(tracker.iOSAndmacOSCompatibility())
    }
    func test_portals() {
        XCTAssert(tracker.portals())
    }
    func test_mainMenu() {
        XCTAssert(tracker.mainMenu())
    }
    func test_togglePause() {
        XCTAssert(tracker.togglePause())
    }
    func test_associateBehaviorsWithSKNodes() {
        XCTAssert(tracker.associateBehaviorsWithSKNodes())
    }
    func test_draggingOnlyOneSKNodeAtATime() {
        XCTAssert(tracker.draggingOnlyOneSKNodeAtATime())
    }
    func test_HUD() {
        XCTAssert(tracker.HUD())
    }
    func test_photoshopLevelTemplate() {
        XCTAssert(tracker.photoshopLevelTemplate())
    }
    func test_ballDesign() {
        XCTAssert(tracker.ballDesign())
    }
    func test_pipeDesign() {
        XCTAssert(tracker.pipeDesign())
    }
    func test_blockDesign() {
        XCTAssert(tracker.blockDesign())
    }
    func test_aspectRatioBoxes() {
        XCTAssert(tracker.aspectRatioBoxes())
    }
    func test_createdUniqueTypefaceForGame() {
        XCTAssert(tracker.createdUniqueTypefaceForGame())
    }
    func test_sksTemplateMade() {
        XCTAssert(tracker.sksTemplateMade())
    }
    func test_autoExportPhotoshopAssets() {
        XCTAssert(tracker.autoExportPhotoshopAssets())
    }
}
