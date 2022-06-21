//
//  SaveDataToCache.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation
import UIKit
import CoreData

struct SaveDataToCache {
    
    func saveFavoriteImage(content:ImageDetailModel) throws  {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let backgroundContext = appDelegate.persistentContainer.newBackgroundContext()
        backgroundContext.performAndWait {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageDetails")
            do {
                //check url and fav value.
                //if data is same dont do anything
                guard let date = content.response?.date else {
                    return
                }
                fetchRequest.predicate = NSPredicate(format: "imgDate == [c]%@", date)
                if let imageDetailsArr = try backgroundContext.fetch(fetchRequest) as? [ImageDetails],
                   imageDetailsArr.count > 0 {
                    for obj in imageDetailsArr {
                        if obj.isImgfavourite == content.isFavourite {
                            throw CacheError.saveToCacheFailed
                        } else {
                            //else update the value of fav button.
                            obj.setValue(content.isFavourite, forKey: "isImgfavourite")
                        }
                    }
                } else {
                    //insert as new data
                    guard let entity = NSEntityDescription.entity(forEntityName: "ImageDetails",
                                                                  in: backgroundContext)
                    else {return}
                    let imageDetailsEntity = ImageDetails(entity: entity,insertInto:backgroundContext)
                    imageDetailsEntity.imgDate = content.response?.date
                    imageDetailsEntity.imgExplanation = content.response?.explanation
                    imageDetailsEntity.imgMediaType = content.response?.media_type
                    imageDetailsEntity.imgTitle = content.response?.title
                    imageDetailsEntity.imgUrl = content.response?.url
                    imageDetailsEntity.isImgfavourite = content.isFavourite ?? false
                }
                do{
                    try backgroundContext.save()
                }
                catch _ as NSError{
                }
            } catch _ as NSError {
            }
        }
    }
}
