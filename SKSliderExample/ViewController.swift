//
//  ViewController.swift
//  SKSliderExample
//
//  Created by admin on 5/30/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var skSlider: SKSliderView!
    @IBOutlet var label: UILabel!
    
    lazy var didSliderValueChange = { [weak self] (_ value: Int) -> Void in
        self?.label.text = String(value)
    }
    
    @IBAction func increaseButton() {
        skSlider.increase(value: 100)
    }
    
    @IBAction func decreaseButton() {
        skSlider.decrease(value: 100)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        skSlider.setup(minValue: 100,
//                       maxValue: 1000,
//                       thumbImage: UIImage(named: "thumb_normal"),
//                       didValueChange: didSliderValueChange)
        skSlider.setup(minValue: 100,
                       maxValue: 1000,
                       thumbImage: UIImage(named: "thumb_normal"),
                       didStepValueChange: didSliderValueChange)
        skSlider.setMoveStep(value: 50)
        skSlider.setTrackLine(height: 10)
        skSlider.setMaximumTrackLine(color: .lightGray)
        skSlider.setMinimumTrackLine(color: .green)
    }

}

