//
//  Thumbnail.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation
import ObjectMapper


class Thumbnail : NSObject, Mappable{
    
    var ext : String?
    var path : String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        ext  <- map["extension"]
        path <- map["path"]
    }
}

