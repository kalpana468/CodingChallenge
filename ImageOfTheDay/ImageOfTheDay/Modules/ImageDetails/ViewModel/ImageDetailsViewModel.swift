//
//  ImageDetailsViewModel.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation

struct ImageDetailModel {
    var response: SearchImageModel?
    var isFavourite: Bool?
}

struct ImageDetailsViewModel {
    var imageModel = ImageDetailModel()
  
    func imageMarkedFav() throws {
        //save the image content to data base
        do {
            try CoredataManager().saveData(forType: .nasaApodFavourites,
                                       with: nil,
                                       data: imageModel as Any)
        } catch {
            throw CacheError.saveToCacheFailed
        }
    }
}
