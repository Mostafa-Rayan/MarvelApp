//
//  Story.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//


import Foundation
import ObjectMapper


class Story : BaseWork{
    
    var characters : PersonWorkItem?
    var comics : PersonWorkItem?
    var creators : [Creator]?
    var descriptionField : String?
    var events : PersonWorkItem?
    var id : Int?
    var modified : String?
    var series : PersonWorkItem?
    var type : String?
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        characters       <- map["characters"]
        comics           <- map["comics"]
        creators         <- map["creators.items"]
        descriptionField <- map["description"]
        events           <- map["events"]
        id               <- map["id"]
        modified         <- map["modified"]
        series           <- map["series"]
        type             <- map["type"]
    }
}
