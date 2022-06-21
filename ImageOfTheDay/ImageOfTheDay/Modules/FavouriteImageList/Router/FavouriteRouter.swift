//
//  FavouriteRouter.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 21/06/22.
//

import Foundation

class FavouriteRouter: BaseRouter {
    // Move to Image details Page
    func showImageDetails() {
        self.viewController.performSegue(withIdentifier: "FavouriteToImageDetailsScreen", sender: self)

    }
}

extension FavouriteRouter : FavouriteRouting {
    func navigate(to option: FavNavigationOption) {
        switch option {
        case .ImageDetails:
            DispatchQueue.main.async  {
                self.showImageDetails()
            }
        case .FullImageView:
            break
        }
        
    }
}
