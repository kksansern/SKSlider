//
//  SKSlider.swift
//  SKSliderExample
//
//  Created by admin on 5/30/19.
//  Copyright © 2019 sk. All rights reserved.
//

import Foundation
import UIKit

class SKSliderView: UIView {
    
    @IBOutlet private var contentView: UIView!
    
    private var minValue: Float = 0
    private var maxValue: Float = 1
    private var stepValue: Float = 0
    private var didValueChange: ((_ value: Float) -> Void)?
    private var didIntValueChange: ((_ value: Int) -> Void)?
    private var didStepValueChange: ((_ value: Int) -> Void)?
    @IBOutlet private var slider: SKCustomSlider!
    
    @IBAction private func sliderValueChange(_ sender: UISlider) {
        self.didChange()
    }
    
    func increase(value: Float) {
        slider.value = slider.value + value/(maxValue - minValue)
        self.didChange()
    }
    
    func decrease(value: Float) {
        slider.value = slider.value - value/(maxValue - minValue)
        self.didChange()
    }
    
    private func didChange() {
        if let didValueChange = didValueChange {
            didValueChange(self.getValue())
        }
        if let didIntValueChange = didIntValueChange {
            didIntValueChange(Int(self.getValue()))
        }
        if let didStepValueChange = didStepValueChange {
            didStepValueChange(self.getStepValue())
        }
    }
    
    func setMoveStep(value: Float) {
        self.stepValue = value
    }
    
    func setTrackLine(color: UIColor, height: CGFloat) {
        setTrackLine(height: height)
        setMinimumTrackLine(color: color)
        setMaximumTrackLine(color: color)
    }
    
    func setTrackLine(height: CGFloat) {
        slider.trackHeight = height
    }
    
    func setMinimumTrackLine(color: UIColor) {
        slider.minimumTrackTintColor = color
    }
    
    func setMaximumTrackLine(color: UIColor) {
        slider.maximumTrackTintColor = color
    }
    
    private func setup(minValue: Float?=nil, maxValue: Float?=nil,
                       thumbImage: UIImage?=nil) {
        if let minValue = minValue {
            self.minValue = minValue
        }
        
        if let maxValue = maxValue {
            self.maxValue = maxValue
        }
        
        if let thumbImage = thumbImage {
            slider.setThumbImage(thumbImage, for: .normal)
        }
    }
    
    func setup(minValue: Float?=nil, maxValue: Float?=nil,
               thumbImage: UIImage?=nil, didValueChange:  ((_ value: Float) -> Void)?=nil) {
        
        setup(minValue: minValue, maxValue: maxValue, thumbImage: thumbImage)
        
        self.didValueChange = didValueChange
    }
    
    func setup(minValue: Float?=nil, maxValue: Float?=nil,
               thumbImage: UIImage?=nil, didIntValueChange:  ((_ value: Int) -> Void)?=nil) {
        
        setup(minValue: minValue, maxValue: maxValue, thumbImage: thumbImage)
        
        self.didIntValueChange = didIntValueChange
    }
    
    func setup(minValue: Float?=nil, maxValue: Float?=nil,
               thumbImage: UIImage?=nil, didStepValueChange:  ((_ value: Int) -> Void)?=nil) {
        
        setup(minValue: minValue, maxValue: maxValue, thumbImage: thumbImage)
        
        self.didStepValueChange = didStepValueChange
    }
    
    func getRawValue() -> Float {
        return slider.value
    }
    
    func getValue() -> Float {
        return (slider.value * (maxValue - minValue)) + minValue
    }
    
    func getStepValue() -> Int {
        let currentValue = Int((slider.value * (maxValue - minValue)) + minValue)
        if stepValue <= 0 {
            return currentValue
        }
        
        let fractionTemp = currentValue % Int(stepValue)
        if fractionTemp >= Int((stepValue/2)) {
            return currentValue - fractionTemp + Int(stepValue)
        } else {
            return currentValue-fractionTemp
        }
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SKSliderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
}


