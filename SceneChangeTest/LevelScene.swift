//
//  LevelScene.swift
//  SceneChangeTest
//
//  Created by Alex Cao on 2/12/17.
//  Copyright © 2017 Alex Cao. All rights reserved.
//

import SpriteKit
import GameplayKit

class LevelScene: SKScene {
    
    let levelLabel = SKLabelNode(fontNamed: "AvenirNext-UltraLight")
    let backLabel = SKLabelNode(fontNamed: "AvenirNext-UltraLight")
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.init(red: 0.9, green: 0.7, blue: 0.2, alpha: 1)
        
        let backMessage = "< Back to title"
        let levelMessage = "under construction!"
        
        // 3
        
        levelLabel.text = levelMessage
        levelLabel.fontSize = 60
        levelLabel.fontColor = SKColor.white
        levelLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(levelLabel)
        
        
        backLabel.text = backMessage
        backLabel.fontSize = 25
        backLabel.fontColor = SKColor.white
        backLabel.position = CGPoint(x: 95, y: size.height - 40)
        addChild(backLabel)

        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        
        if backLabel.contains(location) {
            let fadeColor = UIColor.init(red: 0.6, green: 0.4, blue: 0.2, alpha: 0.5)
            let reveal = SKTransition.fade(with: fadeColor, duration: 2)
            let titleScene = TitleScene(size: self.size)
            self.view?.presentScene(titleScene, transition: reveal)
            
        }
        
        
    }
    
}
