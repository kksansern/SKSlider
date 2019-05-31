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
    private var didValueChange: ((_ value: Float) -> Void)?
    @IBOutlet private var slider: SKCustomSlider!
    
    @IBAction private func sliderValueChange(_ sender: UISlider) {
        if let didValueChange = didValueChange {
            didValueChange(self.getValue())
        }
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
    
    func setup(minValue: Float?=nil, maxValue: Float?=nil,
               thumbImage: UIImage?=nil, didValueChange:  ((_ value: Float) -> Void)?=nil) {
        
        //slider.setMinimumTrackImage(UIImage(named: "progress_left"), for: .normal)
        
        if let minValue = minValue {
            self.minValue = minValue
        }
        
        if let maxValue = maxValue {
            self.maxValue = maxValue
        }
        
        if let thumbImage = thumbImage {
            slider.setThumbImage(thumbImage, for: .normal)
        }
        
        self.didValueChange = didValueChange
    }
    
    func getRawValue() -> Float {
        return slider.value
    }
    
    func getValue() -> Float {
        return (slider.value * (maxValue - minValue)) + minValue
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


