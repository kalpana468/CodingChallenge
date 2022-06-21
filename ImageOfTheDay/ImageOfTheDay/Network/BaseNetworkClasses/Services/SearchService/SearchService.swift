//
//  SearchService.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation

struct FetchService {
    
    func fetchDataFromNetwork<T:Decodable>(url: URL,
                                           responseType: T.Type,
                                           completion:@escaping(_ response: T?, _ error:String?)-> Void)
    {
        let defaultSession = URLSession(configuration: .default)
        
        let dataTask = defaultSession.dataTask(with: url) {  responseData, urlResponse, error in
            
            if let error = error {
                _=completion(nil,error.localizedDescription)
            } else if
                let data = responseData,
                let response = urlResponse as? HTTPURLResponse,
                response.statusCode == 200 {
                self.parseResponse(with: data,
                                   decodingType: responseType) { parsedObj , error in
                    completion(parsedObj, error)
                }
            }
        }
        dataTask.resume()
    }
    
    func parseResponse<T: Decodable>(with responseData: Data, decodingType: T.Type, parser: String? = nil,completion: @escaping (_ parsedObject: T?, _ error:String?) -> Void) {
        
        do {
            let parsedResponse: T = try JSONDecoder().decode(decodingType, from: responseData )
            completion(parsedResponse, nil)
        }
        catch  {
            completion(nil,  NetworkErrorMsgs.jsonParsingFailed.rawValue)
        }
    }
    
}

