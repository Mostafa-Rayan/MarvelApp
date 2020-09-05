//
//  BaseWork.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//


import Foundation
import ObjectMapper


class BaseWork : NSObject, Mappable{
    
    var resourceURI : String?
    var title : String?
    var thumbnail : Thumbnail?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        resourceURI <- map["resourceURI"]
        title  <- map["title"]
        thumbnail  <- map["thumbnail"]
    }
}
