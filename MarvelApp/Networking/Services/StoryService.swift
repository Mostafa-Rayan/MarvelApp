//
//  StoryService.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Moya

public enum StoryService {
    case detail(id: Int)
}

extension StoryService: MarvelAPIType {
    
    public var path: String {
        switch self {
        case .detail(let id):
            return "stories/\(id)"
        }
    }
    
    public var sampleData: Data {
        return returnedResponse(fileName: "Story")
    }
    
}

