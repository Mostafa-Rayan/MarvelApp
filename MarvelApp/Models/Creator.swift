//
//  Creator.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation
import ObjectMapper


class Creator : NSObject, Mappable{
    
    var name : String?
    var resourceURI : String?
    var role : String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        name        <- map["name"]
        resourceURI <- map["resourceURI"]
        role        <- map["role"]
    }
}
