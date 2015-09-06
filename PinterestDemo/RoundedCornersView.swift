//
//  RoundedCornersView.swift
//  PinterestDemo
//
//  Created by Jony Fu on 9/5/15.
//  Copyright (c) 2015 Jony Fu. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornerView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
