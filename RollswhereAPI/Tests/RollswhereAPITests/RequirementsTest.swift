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
}
