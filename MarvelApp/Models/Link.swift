//
//  Link.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation
import ObjectMapper


class Link : NSObject, Mappable{
    
    var type : String?
    var url : String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        type <- map["type"]
        url  <- map["url"]
    }
}
