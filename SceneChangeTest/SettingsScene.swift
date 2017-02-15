//
//  SettingsScene.swift
//  SceneChangeTest
//
//  Created by Alex Cao on 2/14/17.
//  Copyright © 2017 Alex Cao. All rights reserved.
//

import SpriteKit
import GameplayKit

class SettingsScene: SKScene {
    
    let backLabel = SKLabelNode(fontNamed: "AvenirNext-UltraLight")
    
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.init(red: 0.3, green: 0.5, blue: 0.8, alpha: 1)
        
        let musicLabel = SKLabelNode(fontNamed: "AvenirNext-UltraLight")
        let noteLabel = SKLabelNode(fontNamed: "AvenirNext-UltraLight")

        
        
        let backMessage = "< Back to title"
        let musicMessage = "Music"
        let noteMessage = "There's no music, please don't actually click the switch"
        
        backLabel.text = backMessage
        backLabel.fontSize = 25
        backLabel.fontColor = SKColor.white
        backLabel.position = CGPoint(x: 95, y: size.height - 40)
        addChild(backLabel)
        
        musicLabel.text = musicMessage
        musicLabel.fontSize = 40
        musicLabel.fontColor = SKColor.white
        musicLabel.position = CGPoint(x: size.width/2 - 30, y: size.height*2/3)
        addChild(musicLabel)
        
        noteLabel.text = noteMessage
        noteLabel.fontSize = 10
        noteLabel.fontColor = SKColor.white
        noteLabel.position = CGPoint(x: size.width/2, y: size.height*2/3 - 40)
        addChild(noteLabel)
        
        
        let toggleMusic = UISwitch(frame: CGRect(x: size.width/2+50, y: size.height/3 - 25, width: 100, height: 50))
        toggleMusic.isOn = true
        toggleMusic.setOn(true, animated: false)
        toggleMusic.addTarget(self, action: "switchValueDidChange:", for: .valueChanged)
        self.view!.addSubview(toggleMusic)
        
        
    }
    
    func switchValueDidChange(sender:UISwitch!)
    {
        if (sender.isOn == true){
            print("on")
        }
        else{
            print("off")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        
        if backLabel.contains(location) {
            let fadeColor = UIColor.init(red: 0.3, green: 0.4, blue: 0.5, alpha: 0.5)
            let reveal = SKTransition.fade(with: fadeColor, duration: 2)
            let titleScene = TitleScene(size: self.size)
            self.view?.presentScene(titleScene, transition: reveal)
            
        }
        
    }
    
}
