//
//  destination.swift
//  senior
//
//  Created by \ \ ' on 19/2/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import Foundation
import UIKit

class destination{
    var title:String!
    var img:UIImage!
    
    init(title:String, img:UIImage){
        self.title = title
        self.img = img
    }
    
    static func createList()->[destination]{
        return [
            destination(title: "Henderson Waves", img:UIImage (named:"6-Henderson Waves")!),
            destination(title: "canadaaa", img:UIImage (named:"canada")!),
            destination(title: "National Gallery", img:UIImage (named:"15 National gal")!),
            destination(title: "AJ Hackett", img:UIImage (named:"13:1 AJ Hackett at Sentosa")!),
            destination(title: "koreaaa", img:UIImage (named:"korea")!),
            destination(title: "taiwan", img:UIImage (named:"taiwan")!),
            destination(title: "singapore", img:UIImage (named:"singapore")!),
        ]
    }
}
