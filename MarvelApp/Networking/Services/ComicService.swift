//
//  ComicService.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Moya

public enum ComicService {
    case detail(id: Int)
}

extension ComicService: MarvelAPIType {
    
    public var path: String {
        switch self {
        case .detail(let id):
            return "comics/\(id)"
        }
    }
    
    public var sampleData: Data {
        return returnedResponse(fileName: "Comic")
    }
    
    
}
