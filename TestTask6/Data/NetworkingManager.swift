//
//  NetworkingClient.swift
//  TestTask6
//
//  Created by Marcos Vicente on 08.11.2019.
//  Copyright © 2019 Antares Software Group. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingManager {
    
    typealias WebServiceResponse = ([String: Any]?, Error?) -> Void
    
    func executeRequest(_ url: URL, completion: @escaping WebServiceResponse) {
        AF.request(url).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let mainJsonDict = response.value as? [String: Any] {
                    completion(mainJsonDict, nil)
                }
            case .failure(let errorToCatch):
                completion(nil, errorToCatch)
            }
        }
    }
}
