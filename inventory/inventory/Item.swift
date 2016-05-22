//
//  Item.swift
//  inventory
//
//  Created by Ranjit Marathay on 5/3/16.
//  Copyright © 2016 ranjit. All rights reserved.
//

import Foundation
import UIKit


class Item{
    
    var itemName: String;
    var itemType: String;
    var itemImage: UIImage?;
    var itemAvailability: String;
    
    init(withName itemName: String, itemType: String, itemAvailability: String, itemImage: UIImage?){
        self.itemName = itemName;
        self.itemType = itemType;
        self.itemAvailability = itemAvailability;
        self.itemImage = itemImage;
    }
}