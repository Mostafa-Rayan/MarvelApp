//
//  PersonWorkItem.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation
import ObjectMapper


class PersonWorkItem : NSObject, Mappable{
    
    var name : String?
    var resourceURI : String?
    var type : String?
    
    var work: BaseWork?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        name        <- map["name"]
        resourceURI <- map["resourceURI"]
        type        <- map["type"]
    }
    
    func getId() -> Int? {
        if let uri = self.resourceURI {
            if let code = uri.split(separator: "/").last {
                let codeStr = String(code)
                if let codeInt = Int(codeStr) {
                    return codeInt
                }
            }
        }
        return nil
    }
}
