//
//  Extension.swift
//  senior
//
//  Created by \ \ ' on 27/2/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
extension String {
    func computedHeight(atWidth width:CGFloat, font: UIFont) -> CGFloat  {
        let rect = self.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(rect.height)
    }
    
}
extension UIImage {
    func computedHeight(atWidth width:CGFloat) -> CGFloat {
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect  = AVMakeRect(aspectRatio: self.size, insideRect: boundingRect)
        return rect.size.height
    }
}
