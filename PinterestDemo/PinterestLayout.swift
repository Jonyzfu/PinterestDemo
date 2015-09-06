//
//  PinterestLayout.swift
//  PinterestDemo
//
//  Created by Jony Fu on 9/5/15.
//  Copyright (c) 2015 Jony Fu. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath
        indexPath: NSIndexPath) -> CGFloat
}

class PinterestLayout: UICollectionViewLayout {
    var delegate: PinterestLayoutDelegate!
    var numberOfColumns = 1
    var cellPadding: CGFloat = 0
    
    private var cache = [UICollectionViewLayoutAttributes]()
    private var contentHeight: CGFloat = 0
    private var width: CGFloat {
        get {
            let inset = collectionView!.contentInset
            return CGRectGetWidth(collectionView!.bounds) - (inset.left + inset.right)
        }
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSize(width: width, height: contentHeight)
    }
    
    override func prepareLayout() {
        if cache.isEmpty {
            let columnWidth = width / CGFloat(numberOfColumns)
            var xOffsets = [CGFloat]()
            for column in 0..<numberOfColumns {
                xOffsets.append(CGFloat(column) * columnWidth)
            }
            
            var yOffsets = [CGFloat](count: numberOfColumns, repeatedValue: 0)
            
            var currentColumn = 0
            for item in 0..<collectionView!.numberOfItemsInSection(0) {
                let indexPath = NSIndexPath(forItem: item, inSection: 0)
                let height = delegate.collectionView(collectionView!, heightForItemAtIndexPath: indexPath)
                let frame = CGRect(x: xOffsets[currentColumn], y: yOffsets[currentColumn], width: columnWidth, height: height)
                let insetFrame = CGRectInset(frame, cellPadding, cellPadding)
                
                let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                contentHeight = max(contentHeight, CGRectGetMaxY(frame))
                yOffsets[currentColumn] = yOffsets[currentColumn] + height
                currentColumn = currentColumn >= (numberOfColumns - 1) ? 0 : ++currentColumn
            }
        }
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attribute in cache {
            if CGRectIntersectsRect(attribute.frame, rect) {
                layoutAttributes.append(attribute)
            }
        }
        
        return layoutAttributes
    }
}