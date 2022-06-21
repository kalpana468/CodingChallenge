//
//  GetDataFromCache.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import UIKit
import CoreData

struct GetDataFromCache {
    
    func getFavouriteList() throws -> [ImageDetails]?  {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ImageDetails")
        do {
            guard let fetchedList = try managedContext.fetch(fetchRequest) as? [ImageDetails] else {
                return nil
            }
            return fetchedList
        } catch  {
            throw CacheError.fetchFromCacheFailed
        }
    }
}
