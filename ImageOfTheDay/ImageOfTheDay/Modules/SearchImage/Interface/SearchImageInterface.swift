//
//  SearchInterface.swift
//  IOTD
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation
import UIKit

enum SearchNavigationOption {
    case ImageDetails
}
protocol SearchPresenting {
    var router: SearchRouting? { get set }
    var view: SearchViewing? { get set }
    
    func validateDate(pickedDate: Date)->Bool
    func getImage(for date: Date?)
}

protocol SearchInteracting {
    func fetchImageFromApi(for date: String,completion:@escaping(_ response: SearchImageModel?, _ error:String?) -> Void )
}

protocol SearchRouting {
    func navigate(to option: SearchNavigationOption)
}

protocol SearchViewing {
    var presenter: SearchPresenting? { get set }
    func displayError(error: String)
    func displayResult(model: SearchImageModel)

}
