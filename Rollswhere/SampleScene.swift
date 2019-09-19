//
//  Scene.swift
//  Rollswhere
//
//  Created by Marko on 2019-08-15.
//  Copyright © 2019 Marko. All rights reserved.
//

import SpriteKit
import RollswhereEngine

class SampleScene: GameScene {
    
    let sq1 = SKShapeNode(rect: .init(x: -15, y: -2.5, width: 50, height: 7))
    
    let sq2 = { () -> SKShapeNode in
        let n = SKShapeNode(rectOf: .init(width: 100, height: 10))
        n.fillColor = .brown
        n.physicsBody = SKPhysicsBody(edgeLoopFrom: n.frame)
        n.physicsBody?.isDynamic = false
        n.position.y = 0
        return n
    }()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = .brown
        sq1.position.y -= 50
        sq2.position.y += 50
        //game?.addObject(Ball(node: BallNode()))
        addChild(sq2)
    }
    
}
