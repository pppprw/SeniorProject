//
//  Pin.swift
//  senior
//
//  Created by \ \ ' on 7/3/2561 BE.
//  Copyright © 2561 Apple. All rights reserved.
//

import Foundation
import UIKit

class pin{
    var title:String!
    var img:UIImage!
    var name:String!
    
    init(title:String, img:UIImage, name:String){
        self.title = title
        self.img = img
        self.name = name
    }
    
    static func createList()->[pin]{
        return [
            pin(title: "AJ Hackett", img:UIImage (named:"13:1 AJ Hackett at Sentosa")!, name:"bf"),
            pin(title: "Koreaaa", img:UIImage (named:"korea")!, name:"prw"),
            pin(title: "Singapore", img:UIImage (named:"singapore")!, name:"prw"),
        ]
    }
}

