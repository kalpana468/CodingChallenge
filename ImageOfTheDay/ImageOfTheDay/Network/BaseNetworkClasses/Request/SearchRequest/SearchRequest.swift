//
//  SearchRequest.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation

struct SearchRequest {
    let apiBaseUrl: String
    let apiPathUrl: String
    let queryItem : [URLQueryItem]
}
extension SearchRequest : BaseRequest {
    var queryParams: [URLQueryItem] {
        get {
           return queryItem
        }
        set {
            
        }
    }
    
    var baseUrlStr: String {
        return apiBaseUrl
    }
    var pathUrlStr: String {
        return apiPathUrl
    }
}
