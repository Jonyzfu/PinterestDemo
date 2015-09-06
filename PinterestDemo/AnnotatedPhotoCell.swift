//
//  AnnotatedPhotoCell.swift
//  PinterestDemo
//
//  Created by Jony Fu on 9/4/15.
//  Copyright (c) 2015 Jony Fu. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
    
    var photo: Photo? {
        didSet {
            if let photo = photo {
                imageView.image = photo.image
            }
        }
    }
}
