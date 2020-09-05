//
//  PersonWork.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation
import ObjectMapper


class PersonWork : NSObject, Mappable{
    
    var available : Int?
    var collectionURI : String?
    var items : [PersonWorkItem]?
    var returned : Int?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        available     <- map["available"]
        collectionURI <- map["collectionURI"]
        items         <- map["items"]
        returned      <- map["returned"]
    }
}
