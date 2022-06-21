//
//  DownloadImage.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

import Foundation

struct DownloadService {
    
    let downloadsSession = URLSession(configuration: .default)
    
    func downloadImage(imageUrlStr: String, completion: @escaping(_ imagedata : Data? ,_ error: String?) -> Void) {
        guard let imageUrl = URL(string: imageUrlStr) else {
            return
        }
        let downloadTask = downloadsSession.dataTask(with: imageUrl) { data, response, error in
            completion(data,error?.localizedDescription)
        }
        downloadTask.resume()
    }
}
