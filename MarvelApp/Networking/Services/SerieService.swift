//
//  SerieService.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Moya

public enum SerieService {
    case detail(id: Int)
}

extension SerieService: MarvelAPIType {
    
    public var path: String {
        switch self {
        case .detail(let id):
            return "series/\(id)"
        }
    }
    
    public var sampleData: Data {
        return returnedResponse(fileName: "Serie")
    }
    
}


