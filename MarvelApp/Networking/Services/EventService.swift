//
//  EventService.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Moya

public enum EventService {
    case detail(id: Int)
}

extension EventService: MarvelAPIType {
    
    public var path: String {
        switch self {
        case .detail(let id):
            return "events/\(id)"
        }
    }
    
    public var sampleData: Data {
        return returnedResponse(fileName: "Event")
    }
    
}

