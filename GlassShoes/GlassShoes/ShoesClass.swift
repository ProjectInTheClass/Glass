//
//  ShoesClass.swift
//  GlassShoes
//
//  Created by 정민 on 2018. 5. 31..
//  Copyright © 2018년 software_studio1_예림. All rights reserved.
//

import Foundation
import UIKit

class Shoes {
    var name:String
    var imageName:String
    var brand:String
    var pNum:String
    var price:Int
    var errRegion:Int
    
    init (name:String, imageName:String, brand:String, pNum:String, price:Int, errRegion:Int) {
        self.name = name
        self.imageName = imageName
        self.brand = brand
        self.pNum = pNum
        self.price = price
        self.errRegion = errRegion
    }
}
