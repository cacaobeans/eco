//
//  GameViewController.swift
//  SceneChangeTest
//
//  Created by Alex Cao on 2/12/17.
//  Copyright © 2017 Alex Cao. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = TitleScene(size: view.bounds.size)
        let reveal = SKTransition.fade(withDuration: 5)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene, transition: reveal)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
