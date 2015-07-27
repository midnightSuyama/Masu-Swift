//
//  UIView+Masu.swift
//  Masu
//
//  Created by midnightSuyama on 07/27/2015.
//  Copyright (c) 2015 midnightSuyama. All rights reserved.
//

import UIKit

extension UIView {
    public func showMasu() {
        if let masu = self.viewWithTag(UIView.masuTag()) as? MasuDisableHitTest {
            masu.hidden = false
        } else {
            let masu = MasuDisableHitTest(frame: self.bounds)
            masu.backgroundColor  = UIColor(white: 0, alpha: 0.5)
            masu.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
            masu.tag              = UIView.masuTag()
            self.addSubview(masu)
        }
    }
    
    public func hideMasu() {
        if let masu = self.viewWithTag(UIView.masuTag()) as? MasuDisableHitTest {
            masu.hidden = true
        }
    }
    
    public static func masuTag() -> NSInteger {
        return NSStringFromClass(Masu).hash
    }
}

private class MasuDisableHitTest: Masu {
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        return nil
    }
}
