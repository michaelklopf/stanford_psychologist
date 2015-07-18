//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Michael on 13.07.15.
//  Copyright © 2015 Michael Klopf. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    private struct Constants {
        static let HappinessGestureScale: CGFloat = 4
    }
    
    @IBAction func changeHappiness(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = sender.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0 {
                happiness += happinessChange
                sender.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    var happiness: Int = 50 { // 0 is very sad, 100 is super happy
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50)/50
    }
    
    func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
}
