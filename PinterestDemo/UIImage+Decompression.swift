//
//  UIImage+Decompression.swift
//  PinterestDemo
//
//  Created by Jony Fu on 9/4/15.
//  Copyright (c) 2015 Jony Fu. All rights reserved.
//

import UIKit

extension UIImage {
    
    var decompressedImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        drawAtPoint(CGPointZero)
        let decompressedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return decompressedImage
    }
}
