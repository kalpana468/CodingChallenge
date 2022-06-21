//
//  SearchRouter.swift
//  IOTD
//
//  Created by Mohapatra, Kalpana on 21/06/22.
//

import UIKit

class BaseRouter {
    fileprivate unowned var _viewController: UIViewController
    init(viewController: UIViewController) {
        _viewController = viewController
    }
}
extension BaseRouter {
    var viewController: UIViewController {
        return _viewController
    }
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

class SearchRouter: BaseRouter
{
    
    // Move to Image details Page
    func showImageDetails() {
        self.viewController.performSegue(withIdentifier: "SearchToImageDetailsScreen", sender: self)

    }
}

extension SearchRouter : SearchRouting {
    func navigate(to option: SearchNavigationOption) {
        switch option {
        case .ImageDetails:
            DispatchQueue.main.async  {
                self.showImageDetails()
            }
        }
        
    }
}
