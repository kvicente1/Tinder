//
//  CardsViewController.swift
//  Tinder
//
//  Created by Felipe De La Torre on 11/22/18.
//  Copyright © 2018 Felipe De La Torre. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    
    @IBOutlet weak var ImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
            cardInitialCenter = ImageView.center
        }
            
        else if sender.state == .changed {
            print("Gesture changed")
            var angle = 0.0
            if (translation.x > 0) {
                if (translation.x < 15) {
                    angle = Double(translation.x)
                } else {
                    angle = 15.0
                }
                ImageView.transform = CGAffineTransform(rotationAngle: CGFloat(angle * Double.pi / 180))
                ImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y:cardInitialCenter.y)
                
            }
            else {
                if (translation.x > -0) {
                    angle = Double(translation.x)
                } else {
                    angle = -15.0
                }
                ImageView.transform = CGAffineTransform(rotationAngle: CGFloat(angle * Double.pi / 180))
                ImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y:cardInitialCenter.y)
            }
            
        }
            
        else if sender.state == .ended {
            print("Gesture end")
            
            if (translation.x > 100) {
                UIView.animate(withDuration:0.4, delay: 0.0,
                               options: [],
                               animations: { () -> Void in
                                self.ImageView.transform = CGAffineTransform(translationX: 500, y: 0)
                }, completion: nil)
            }
            else if (translation.x < -100) {
                UIView.animate(withDuration:0.4, delay: 0.0,
                               options: [],
                               animations: { () -> Void in
                                self.ImageView.transform = CGAffineTransform(translationX: -500, y: 0)
                }, completion: nil)
            }
            else {
                ImageView.transform = CGAffineTransform.identity
            }
            
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! ProfileViewController
        destinationViewController.image = self.ImageView.image
    }
    
}
