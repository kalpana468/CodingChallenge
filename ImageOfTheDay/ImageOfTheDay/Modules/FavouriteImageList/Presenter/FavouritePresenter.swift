//
//  FavouritePresenter.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 21/06/22.
//

import Foundation
struct FavouritePresenter  {
    
    var router: FavouriteRouting?
    var interactor:FavouriteInteracting
    var view:FavouriteViewing?
    
    init(favInteracting:FavouriteInteracting , favRouting:FavouriteRouting,
         favViewing:FavouriteViewing){
        self.interactor = favInteracting
        self.router = favRouting
        self.view = favViewing
    }
    
}

extension FavouritePresenter: FavouritePresenting {
    
    func getFavouritesList() {
        self.interactor.getFavouritesList { list , error in
            if let imageList = list {
                self.view?.displayResult(model: imageList)
            } else if let err = error  {
                self.view?.displayError(error: err)
            }
        }
    }
    
    
}
