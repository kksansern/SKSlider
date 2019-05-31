//
//  SKCustomSlider.swift
//  SKSliderExample
//
//  Created by admin on 5/31/19.
//  Copyright © 2019 sk. All rights reserved.
//

import UIKit

@IBDesignable
class SKEZCustomSlider: UISlider {
    @IBInspectable var trackHeight: CGFloat = 3
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        // Use properly calculated rect
        var newRect = super.trackRect(forBounds: bounds)
        newRect.size.height = trackHeight
        return newRect
    }
}
