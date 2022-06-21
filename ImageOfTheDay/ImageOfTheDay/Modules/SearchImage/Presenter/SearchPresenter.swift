//
//  SearchPresenter.swift
//  IOTD
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation

struct SearchPresenter  {
    
    var router: SearchRouting?
    var interactor:SearchInteracting
    var view:SearchViewing?
    
    init(searchInteracting:SearchInteracting , searchRouting:SearchRouting,
         searchViewing:SearchViewing){
        self.interactor = searchInteracting
        self.router = searchRouting
        self.view = searchViewing
    }
    
}

extension SearchPresenter: SearchPresenting {
    func checkNetwork() -> Bool {
        return NetworkDetector.isReachable()
    }
    
    func validateDate(pickedDate: Date) -> Bool {
        guard let numOfdays = Date().daysBetween(newDate: pickedDate) else {
            return false
        }
        return numOfdays <= 0
    }    
    
    func getImage(for date: Date?) {
        
        if !checkNetwork() {
            self.view?.displayError(error:AlertMessages.networkUnavailable.rawValue)
            return
        }
        guard let dateSelected = date else {
            self.view?.displayError(error:AlertMessages.noDate.rawValue)
            return
        }
        guard let dateSelectedStr = Date().convertDateToString(date: dateSelected) else {
            self.view?.displayError(error:AlertMessages.dateConversionFailed.rawValue)
            return
        }
        
        
        self.interactor.fetchImageFromApi(for: dateSelectedStr) { response, error in
            //Route to image detail screen
            if let data = response {
                self.view?.displayResult(model: data)
                self.router?.navigate(to:.ImageDetails)
            } else {
                //Pass the error to view
                self.view?.displayError(error: error ?? AlertMessages.fetchImageFailed.rawValue)
            }
        }
    }
    
        
}
