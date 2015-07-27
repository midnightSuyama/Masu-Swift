//
//  Masu.swift
//  Masu
//
//  Created by midnightSuyama on 07/27/2015.
//  Copyright (c) 2015 midnightSuyama. All rights reserved.
//

import UIKit

@IBDesignable public class Masu: UIView {
    
    @IBInspectable public var text: NSString?
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setNeedsDisplay", name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Masu.defaultBackgroundColor()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setNeedsDisplay", name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    public override func drawRect(rect: CGRect) {
        Masu.renderWithSize(rect.size, backgroundColor: self.backgroundColor!, labelText: self.text)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    // MARK: - UIImage
    
    public static func imageWithSize(size: CGSize, backgroundColor color: UIColor = Masu.defaultBackgroundColor(), labelText text: NSString? = nil) -> UIImage {
        let image: UIImage
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        Masu.renderWithSize(size, backgroundColor: color, labelText: text)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        
        return image;
    }
    
    // MARK: - private
    
    private static func renderWithSize(size: CGSize, backgroundColor color: UIColor = Masu.defaultBackgroundColor(), labelText text: NSString? = nil) {
        let strokeColor = Masu.strokeColorOnBackgroundColor(color)
        
        // Background
        color.setFill()
        UIRectFill(CGRectMake(0, 0, size.width, size.height))
        
        // Path
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, strokeColor.CGColor)
        CGContextSetLineWidth(context, 2)
        CGContextMoveToPoint(context, size.width, 0)
        CGContextAddLineToPoint(context, size.width, size.height)
        CGContextAddLineToPoint(context, 0, size.height)
        CGContextAddLineToPoint(context, 0, 0)
        CGContextAddLineToPoint(context, size.width, 0)
        CGContextAddLineToPoint(context, 0, size.height)
        CGContextStrokePath(context)
        
        // Label
        var label = NSString(format: "%.0f x %.0f", size.width, size.height)
        if let letText = text {
            label = NSString(format: "%@\n%@", letText, label)
        }
        
        let paragraphSyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        paragraphSyle.alignment     = NSTextAlignment.Center
        paragraphSyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
        let labelAttr: [String : AnyObject] = [
            NSParagraphStyleAttributeName:  paragraphSyle,
            NSFontAttributeName:            UIFont.boldSystemFontOfSize(13),
            NSForegroundColorAttributeName: strokeColor,
        ]
        
        var labelRect = label.boundingRectWithSize(CGSizeMake(size.width, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: labelAttr, context: nil)
        labelRect.origin.x = (size.width  - labelRect.size.width)  / 2
        labelRect.origin.y = (size.height - labelRect.size.height) / 2
        
        color.setFill()
        UIRectFill(labelRect)
        
        label.drawInRect(labelRect, withAttributes: labelAttr)
    }
    
    private static func strokeColorOnBackgroundColor(color: UIColor) -> UIColor {
        var r = CGFloat(0), g = CGFloat(0), b = CGFloat(0)
        color.getRed(&r, green: &g, blue: &b, alpha: nil)
        let y = (r * 0.299) + (g * 0.587) + (b * 0.114)
        
        return (y > 0.75) ? UIColor.blackColor() : UIColor.whiteColor()
    }
    
    private static func defaultBackgroundColor() -> UIColor {
        return UIColor.lightGrayColor()
    }
}
