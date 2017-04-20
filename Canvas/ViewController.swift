//
//  ViewController.swift
//  Canvas
//
//  Created by LING HAO on 4/19/17.
//  Copyright © 2017 CodePath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var trayView: UIView!
    
    var trayCenter: CGPoint?
    
    var trayCenterWhenUp: CGPoint?
    var trayCenterWhenDown: CGPoint?
    
    var imageCenter:CGPoint?
    var newlyCreatedFace: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        trayCenterWhenDown = trayView.center
        let half = trayView.frame.height - 31
        trayCenterWhenUp = CGPoint(x: trayView.center.x, y: trayView.center.y - half)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onImageGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let point = sender.location(in: view)
        if sender.state == UIGestureRecognizerState.began {
            let imageView = sender.view as! UIImageView
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace!)
//            newlyCreatedFace?.center = imageView.center
//            newlyCreatedFace?.center.y += trayView.frame.origin.y
            imageCenter = imageView.center
        } else if sender.state == UIGestureRecognizerState.changed {
            newlyCreatedFace?.center = point
//            if let imageCenter = imageCenter {
//                newlyCreatedFace?.center = CGPoint(x: imageCenter.x + translation.x, y: imageCenter.y + translation.y)
//            }
        } else if sender.state == UIGestureRecognizerState.ended {
            
        }

        
    }
    
    @IBAction func onTrayPanGesture(_ sender: UIPanGestureRecognizer) {
        
        let point = sender.location(in: view)
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            print("gesture began \(point)")
            trayCenter = trayView.center
        } else if sender.state == UIGestureRecognizerState.changed {
            print("gesture began \(point)")
            trayView.center = CGPoint(x: trayCenter!.x, y: trayCenter!.y + translation.y)
        } else if sender.state == UIGestureRecognizerState.ended {
            print("gesture began \(point)")
            
//            UIView.animate(withDuration: 0.3, animations: { 
//                if velocity.y > 0 {
//                    // moving down
//                    self.trayView.center = self.trayCenterWhenDown!
//                } else {
//                    // moving up
//                    self.trayView.center = self.trayCenterWhenUp!
//                }
//            })
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
                if velocity.y > 0 {
                    // moving down
                    self.trayView.center = self.trayCenterWhenDown!
                } else {
                    // moving up
                    self.trayView.center = self.trayCenterWhenUp!
                }
            }, completion: { (success: Bool) in
                print("Completed")
            })
        }

    }

}

