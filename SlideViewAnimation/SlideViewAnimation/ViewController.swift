//
//  ViewController.swift
//  SlideViewAnimation
//
//  Created by Himanshu H. Padia on 03/08/16.
//  Copyright © 2016 All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var rectView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.slideToDown))
        swipeRight.direction = .Right
        self.rectView!.addGestureRecognizer(swipeRight)
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.slideToDown))
        swipeLeft.direction = .Left
        self.rectView!.addGestureRecognizer(swipeLeft)
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.slideToDown))
        swipeUp.direction = .Up
        self.rectView!.addGestureRecognizer(swipeUp)
        let swipeDown: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.slideToDown))
        swipeDown.direction = .Down
        self.rectView!.addGestureRecognizer(swipeDown)
    }
    
    func slideToDown(gestureRcognizer: UISwipeGestureRecognizer) {
        if gestureRcognizer.direction == .Right {
            self.viewSlideInFromLeftToRight(rectView!)
        }
        else if gestureRcognizer.direction == .Left {
            self.viewSlideInFromRightToLeft(rectView!)
        }
        else if gestureRcognizer.direction == .Up {
            self.viewSlideInFromBottomToTop(rectView!)
        }
        else if gestureRcognizer.direction == .Down {
            self.viewSlideInFromTopToBottom(rectView!)
        }
    }
    
    func initAnimation (subtype: String) -> CATransition {
        var transition: CATransition? = nil
        transition = CATransition()
        transition!.duration = 0.5
        //kAnimationDuration
        transition!.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        transition!.type = kCATransitionPush
        transition!.subtype = subtype
        transition!.delegate = self
        return transition!
    }
    
    func viewSlideInFromRightToLeft(views: UIView) {
        let transition = self.initAnimation(kCATransitionFromRight)
        views.layer.addAnimation(transition, forKey: nil)
        
        //UIView.transitionWithView(views, duration: 2.0, options: UIViewAnimationOptions.TransitionFlipFromTop, animations: {() -> Void in }, completion: { _ in })
    }
    
    func viewSlideInFromLeftToRight(views: UIView) {
        let transition = self.initAnimation(kCATransitionFromLeft)
        views.layer.addAnimation(transition, forKey: nil)
    }
    
    func viewSlideInFromTopToBottom(views: UIView) {
        let transition = self.initAnimation(kCATransitionFromBottom)
        views.layer.addAnimation(transition, forKey: nil)
    }
    
    func viewSlideInFromBottomToTop(views: UIView) {
        let transition = self.initAnimation(kCATransitionFromTop)
        views.layer.addAnimation(transition, forKey: nil)
    }
    
    
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    override func animationDidStop(theAnimation: CAAnimation, finished flag: Bool) {
        let lightOp: UIColor = getRandomColor()
        rectView?.backgroundColor = lightOp
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

