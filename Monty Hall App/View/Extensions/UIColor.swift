//
//  Colors.swift
//  Monty Hall App
//
//  Created by Diogo Infante on 02/11/21.
//

import UIKit

/// UIColor Extensions
extension UIColor {
    /// Initializes a UIColor from the absolute color values instead of normalized
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
    /// App colors
    static var mYellow: UIColor  { return UIColor(r: 249, g: 219, b: 87) }
    static var mGray: UIColor  { return UIColor(r: 94, g: 94, b: 94) }
    static var mDarkGray: UIColor  { return UIColor(r: 33, g: 33, b: 33) }
    static var mIce: UIColor  { return UIColor(r: 242, g: 237, b: 228) }
    static var mPallete1: UIColor { return UIColor(r: 248, g: 214, b: 151) }
}
