//
//  SearchInteractor.swift
//  IOTD
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation

class SearchInteractor {

}

extension SearchInteractor : SearchInteracting {
    func fetchImageFromApi(for date: String,completion:@escaping(_ response: SearchImageModel?, _ error:String?) -> Void ) {
        
        let searchReq = SearchRequest(apiBaseUrl: nasaApibaseURL,
                                      apiPathUrl: nasaApodApiPathURL,
                                      queryItem: [
                                        URLQueryItem(name: nasaApodKeyQueryKey, value: nasaApiKeyQueryValue),
                                        URLQueryItem(name: nasaApodDateQueryKey, value: date)] )

        let searchReqUrl = searchReq.urlComponents.url!
        
        FetchService().fetchDataFromNetwork(url: searchReqUrl,
                                            responseType: SearchImageModel.self) { data, errorstr in
            completion(data,errorstr)
            
        }
    }
}
