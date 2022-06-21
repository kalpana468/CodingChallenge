//
//  Constants.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation


let nasaApibaseURL = "https://api.nasa.gov"
let nasaApodApiPathURL = "/planetary/apod"
let nasaApiKeyQueryValue = "DEMO_KEY"
let nasaApodKeyQueryKey = "api_key"
let nasaApodDateQueryKey = "date"
let YYYYMMDDdateFormat : String = "yyyy-MM-dd"

enum MediaType: String {
    case image = "image"
    case video = "video"
}

enum NetworkErrorMsgs: String {
    case jsonParsingFailed =  "Could not parse the image response."
}


enum CacheError: Error {
    case fetchFromCacheFailed
    case saveToCacheFailed
}
extension CacheError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .fetchFromCacheFailed:
            return "Could not fetch favourite list."
        case .saveToCacheFailed:
            return "Could not save image to favourites."
        }
    }
}

enum AlertMessages: String {
    case fetchImageFailed = "Could not fetch image for this date. Please try again."
    case noDate = "Incorrect date or No Date. Please try a new date."
    case futureDate = "Could not fetch image for future date. Please try current date or lesser date."
    case dateConversionFailed = "Could not load image for this date. Please try a different date."
    case networkUnavailable = "Please check your internet connection."
    case itemMarkedFavFailed = "Imaged could not be added to favourites. Please try again"
    case favExistsAlready = "Imaged already in favourites."
}

enum ToastMessages: String {
    case dataSaved = "Data saved successfully."
    case itemMarkedFav = "Imaged added to favourites."
    case noFavsToLoad = "Currently there are no favourite images to show."
}

enum ToastTitle: String {
    case itemMarkedFav = "Great!!"
    case noFavsToLoad = "OOPs!!"
}

enum ToastTimer: Double {
    case favToastMsgTimer = 2.0
    case noFavToastMsgTimer = 1.0

}

