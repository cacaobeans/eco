//
//  TitleScene.swift
//  SceneChangeTest
//
//  Created by Alex Cao on 2/12/17.
//  Copyright © 2017 Alex Cao. All rights reserved.
//

import SpriteKit
import GameplayKit

class TitleScene: SKScene {
    
    let titleLabel = SKLabelNode(fontNamed: "AvenirNext-UltraLight")
    let playLabel = SKLabelNode(fontNamed: "AvenirNext-UltraLight")
    let settingsLabel = SKLabelNode(fontNamed: "AvenirNext-UltraLight")
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.init(red: 0.4, green: 0.8, blue: 0.3, alpha: 1)
        
        let titleMessage = "ECO"
        let playMessage = "PLAY"
        let settingsMessage = "Settings"
        
        // 3
        
        titleLabel.text = titleMessage
        titleLabel.fontSize = 80
        titleLabel.fontColor = SKColor.white
        titleLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(titleLabel)
        
        
        playLabel.text = playMessage
        playLabel.fontSize = 40
        playLabel.fontColor = SKColor.white
        playLabel.position = CGPoint(x: size.width/2, y: size.height/2 - 80)
        addChild(playLabel)
        
        settingsLabel.text = settingsMessage
        settingsLabel.fontSize = 25
        settingsLabel.fontColor = SKColor.white
        settingsLabel.position = CGPoint(x: size.width/2, y: size.height/2 - 120)
        addChild(settingsLabel)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        
        if playLabel.contains(location) {
            let fadeColor = UIColor.init(red: 0.6, green: 0.4, blue: 0.2, alpha: 0.5)
            let reveal = SKTransition.fade(with: fadeColor, duration: 2)
            let levelScene = LevelScene(size: self.size)
            self.view?.presentScene(levelScene, transition: reveal)

        }
        
        if settingsLabel.contains(location) {
            let fadeColor = UIColor.init(red: 0.3, green: 0.4, blue: 0.5, alpha: 0.5)
            let reveal = SKTransition.fade(with: fadeColor, duration: 2)
            let settingsScene = SettingsScene(size: self.size)
            self.view?.presentScene(settingsScene, transition: reveal)
            
        }
        
        
    }
    
}
