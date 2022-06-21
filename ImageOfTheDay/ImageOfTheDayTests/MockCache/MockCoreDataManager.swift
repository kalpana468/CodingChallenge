//
//  MockCoreDataManager.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 21/06/22.
//

import Foundation

enum CacheType {
    case favouritesList
    case imageDetails
}


struct CoredataManager {
    func saveData(forType: CacheType, with Id: String?, data: Any) {
        switch forType {
        case .favouritesList: break
        case .imageDetails: break
        }
        
    }
    
    func getData(forType:CacheType, with id: Any?) throws -> Any? {
        switch forType {
        case .favouritesList:
            let fileName = "MockFavList"
            if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
                do {
                    let responseData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    return responseData
                } catch {
                    return nil
                }
            }
            
        case .imageDetails:
            return nil
        }
        return nil
    }
    
}
