//
//  CustomControlData.swift
//  TestTask6
//
//  Created by Marcos Vicente on 02.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

class CustomControlData {
    
//    read-only properties
    public private(set) var color: UIColor
    public private(set) var text: [String]
    
    public init(color: UIColor, text: [String]) {
        self.color = color
        self.text = text
    }
}
