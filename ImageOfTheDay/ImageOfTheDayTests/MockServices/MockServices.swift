//
//  MockServices.swift
//  ImageOfTheDayTests
//
//  Created by Mohapatra, Kalpana on 21/06/22.
//

import Foundation
  

struct FetchService {
    
    func fetchDataFromNetwork<T:Decodable>(url: URL,
                                           responseType: T.Type,
                                           completion:@escaping(_ response: T?, _ error:String?)-> Void)
    {
        
        let pathComponents = url.pathComponents
        if pathComponents.contains("date") {
            let fileName = "MockSearchResponse"
            if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
                do {
                    let responseData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    completion(responseData as? T ,nil)
                } catch {
                    completion(nil,error.localizedDescription)
                }
            }
        }
    }
}
