//
//  CoredataManager.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation
import CoreData

enum CacheType {
    case nasaApodFavourites
}
/* TODO: refactor here
protocol CoreDataManagerService {
    var persistentContainer: NSPersistentContainer! { get set }
    
    func getMainContext() -> NSManagedObjectContext
    func getBackgroundContext() -> NSManagedObjectContext
    
    init()
    init(container: NSPersistentContainer?)
}

extension CoreDataManagerService {
    init(container: NSPersistentContainer?) {
        self.init()
        self.persistentContainer = container
    }
    
    func getMainContext() -> NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    func getBackgroundContext() -> NSManagedObjectContext {
        return self.persistentContainer.newBackgroundContext()
    }
}*/

struct CoredataManager {
    func saveData(forType: CacheType, with Id: String?, data: Any) throws {
        do {
            switch forType {
            case .nasaApodFavourites:
                guard let content = data as? ImageDetailModel else {
                    return
                }
                try SaveDataToCache().saveFavoriteImage(content: content)
            }
        } catch {
            throw CacheError.saveToCacheFailed
        }
    }
    
    func getData(forType:CacheType, with id: Any?) throws -> Any? {
        do {
            switch forType {
            case .nasaApodFavourites:
                return try GetDataFromCache().getFavouriteList()
            }
        } catch {
            throw CacheError.fetchFromCacheFailed
        }
    }
}
