//
//  CustomDataManager.swift
//  TestTask6
//
//  Created by Marcos Vicente on 02.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import UIKit

class CustomDataManager {
//    making a class a singleton means to make it impossible to instanciate the class more than once and accessable from anywhere in the code
    static let shared = CustomDataManager()
    
    private init() {
        // set up CustomDataManager instance
    }
    
    func getObject () -> CustomControlData {
        let randomText: [String] = ["I am a trainee iOS Developer", "I am a tech lover", "I  Apple", "This is a random text", "I study in Russia"]
        let randomColor = UIColor.randomColor()
        let objectToReturn = CustomControlData(color: randomColor, text: randomText)
        return objectToReturn
    }
//    closure used as a trailling closure
    func dataGenerator (returnData: (CustomControlData) -> Void)  {
        let randomText: [String] = ["I am a trainee iOS Developer", "I am a tech lover", "I  Apple", "This is a random text", "I study in Russia"]
        let randomColor = UIColor.randomColor()
        let objectToBeReturned = CustomControlData(color: randomColor, text: randomText)
        returnData(objectToBeReturned)
    }
    
//    closure stored and accessed as a class property
    var generatedDataToBeReturned: ((CustomControlData) -> Void)?
    
    func generateData () {
        let randomText: [String] = ["I am a trainee iOS Developer", "I am a tech lover", "I  Apple", "This is a random text", "I study in Russia"]
        let randomColor = UIColor.randomColor()
        let objectToBeReturned = CustomControlData(color: randomColor, text: randomText)
        self.generatedDataToBeReturned?(objectToBeReturned)
    }
    
}
