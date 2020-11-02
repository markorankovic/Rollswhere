import Hope
import RollswhereAPI

final class RequirementsTest: Hopes {
    let api = RollswhereAPI()
    func test_shootBall() {
        XCTAssert(api.shootBall())
    }
    func test_nextLevel() {
        XCTAssert(api.nextLevel())
    }
    func test_returnBall() {
        XCTAssert(api.returnBall())
    }
    func test_returnToMainMenu() {
        XCTAssert(api.returnToMainMenu())
    }
    func test_shootHook() {
        XCTAssert(api.shootHook())
    }
    func test_showPowerLevel() {
        XCTAssert(api.showPowerLevel())
    }
    func test_startWithLevel() {
        XCTAssert(api.startWithLevel())
    }
    func test_toggleActivateBall() {
        XCTAssert(api.toggleActivateBall())
    }
    func test_zoomFeatures() {
        XCTAssert(api.zoomFeatures())
    }
}
