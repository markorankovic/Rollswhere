//
//  GameViewController.swift
//  Rollswhere
//
//  Created by Marko Rankovic on 8/10/20.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    enum ViewControllerError: Error {
        case notSKView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try startGameScene(view, GameScene())
        } catch ViewControllerError.notSKView {
            print("View passed in is not an SKView")
        } catch {
            print("Unknown error")
        }
    }
    
    private func startGameScene(_ view: UIView, _ gamescene: GameScene) throws {
        guard let skview = view as? SKView else {
            throw ViewControllerError.notSKView
        }
        skview.presentScene(gamescene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
