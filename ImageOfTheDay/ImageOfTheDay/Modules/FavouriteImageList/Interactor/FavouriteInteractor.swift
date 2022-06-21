//
//  FavouriteInteractor.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 21/06/22.
//

import Foundation

struct FavouriteInteractor: FavouriteInteracting {
    
    func getFavouritesList(completion: @escaping ([ImageDetails]?, String?) -> Void) {
        do {
            let favListarray =   try CoredataManager().getData(forType: .nasaApodFavourites, with: nil) as? [ImageDetails]
            completion(favListarray , nil)
        } catch  {
            completion(nil, CacheError.fetchFromCacheFailed.errorDescription)
        }
    }
}

