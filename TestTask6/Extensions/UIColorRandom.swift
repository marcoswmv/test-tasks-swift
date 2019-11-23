//
//  ExtensionUIColor.swift
//  TestTask6
//
//  Created by Marcos Vicente on 06.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

extension UIColor {
    class func randomColor() -> UIColor{
        let randomRed = CGFloat(drand48())
        let randomGreen = CGFloat(drand48())
        let randomBlue = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
