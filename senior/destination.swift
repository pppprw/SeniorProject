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
    var name:String!
    
    init(title:String, img:UIImage, name:String){
        self.title = title
        self.img = img
        self.name = name
    }
    
    static func createList()->[destination]{
        return [
            destination(title: "Henderson Waves", img:UIImage (named:"6-Henderson Waves")!, name:"bf"),
            destination(title: "Canadaaa", img:UIImage (named:"canada")!, name:"prw"),
        
            destination(title: "AJ Hackett", img:UIImage (named:"13:1 AJ Hackett at Sentosa")!, name:"bf"),
            destination(title: "Koreaaa", img:UIImage (named:"korea")!, name:"prw"),
            destination(title: "Taiwan", img:UIImage (named:"taiwan")!, name:"prw"),
            destination(title: "Singapore", img:UIImage (named:"singapore")!, name:"prw"),
        ]
    }
}
