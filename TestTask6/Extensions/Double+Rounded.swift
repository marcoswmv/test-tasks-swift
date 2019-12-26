//
//  Double.swift
//  TestTask6
//
//  Created by Marcos Vicente on 19.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import Foundation
import UIKit

extension Double {
//    Rounds the double to decimal places
    public func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
