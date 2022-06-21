//
//  BaseRequest.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//
import Foundation

protocol BaseRequest {
    var baseUrlStr: String { get }
    var pathUrlStr: String { get }
    var pathComps : String { get set }
    var queryParams : [URLQueryItem] { get set }
    var headers: [String : String] { get }
}

extension BaseRequest {
    
    var queryItem : [URLQueryItem] {
       return queryParams
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: baseUrlStr)!
        components.path =  pathUrlStr
        if queryItem.count > 0 {
          components.queryItems = queryItem
        }
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
    
    var headers: [String : String] {
        get {
            return [:]
        }
    }
    
    var pathComps: String {
        get {
            return ""
        }
        set {
        }
    }
    
    var queryParams: [URLQueryItem] {
        get {
            return []
        }
        set {
        }
    }
}
