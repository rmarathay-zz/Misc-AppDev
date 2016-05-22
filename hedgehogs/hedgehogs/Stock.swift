//
//  Stock.swift
//  hedgehogs
//
//  Created by Ranjit Marathay on 5/22/16.
//  Copyright © 2016 ranjit. All rights reserved.
//

import Foundation
import UIKit


class Stock{
    
    var valuation: Double;
    var name: String;
    var rec: String;
    
    init(Name stockname: String, stockVal: Double, stockRec: String){
        self.valuation = stockVal;
        self.name = stockname;
        self.rec = stockRec;
    }
}

