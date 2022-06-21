//
//  ImageModel.swift
//  ImageOfTheDay
//
//  Created by Mohapatra, Kalpana on 20/06/22.
//

struct SearchImageModel: Decodable {
    var copyright : String?
    var date : String?
    var explanation : String?
    var hdurl: String?
    var media_type: String?
    var service_version: String?
    var title: String?
    var url: String?
}
