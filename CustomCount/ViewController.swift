//
//  ViewController.swift
//  CustomCount
//
//  Created by 藤井陽介 on 2017/06/30.
//  Copyright © 2017年 藤井陽介. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel! {
        didSet {
            numberLabel.clipsToBounds = true
            numberLabel.text = String(number)
            
            for i in 1...2 {
                let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(touchesLabel(_:)))
                swipeGesture.direction = UISwipeGestureRecognizerDirection(rawValue: UInt(i))
                numberLabel.addGestureRecognizer(swipeGesture)
            }
        }
    }
    
    var number: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func touchesLabel(_ sender: UISwipeGestureRecognizer) {        
        if sender.direction == .left {
            number -= 1
            UIView.transition(with: numberLabel, duration: 0.7, options: [.transitionFlipFromRight], animations: {
                self.numberLabel.text = String(self.number)
            }, completion: nil)
        } else if sender.direction == .right {
            number += 1
            UIView.transition(with: numberLabel, duration: 0.7, options: [.transitionFlipFromLeft], animations: {
                self.numberLabel.text = String(self.number)
            }, completion: nil)
        }
    }
}

