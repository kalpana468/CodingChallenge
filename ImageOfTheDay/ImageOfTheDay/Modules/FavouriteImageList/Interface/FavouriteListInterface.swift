//
//  FavouriteListInterface.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation
import UIKit

enum FavNavigationOption {
    case ImageDetails
    case FullImageView
}

protocol FavouritePresenting {
    var router: FavouriteRouting? { get set }
    var view: FavouriteViewing? { get set }
    
    func getFavouritesList()
}

protocol FavouriteInteracting {
    func getFavouritesList(completion:@escaping(_ response: [ImageDetails]?,
                                                _ error:String?) -> Void)
}

protocol FavouriteRouting {
    func navigate(to option: FavNavigationOption )
}

protocol FavouriteViewing {
    var favPresenter: FavouritePresenting? { get set }
    func displayError(error: String)
    func displayResult(model: [ImageDetails])
}
