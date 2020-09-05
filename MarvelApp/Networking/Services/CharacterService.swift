//
//  CharacterService.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Moya

public enum CharacterService {
    case list(limit: Int, offset: Int, query: String)
}

extension CharacterService: MarvelAPIType {
    public var path: String {
        switch self {
        case .list(_, _, _):
            return "characters"
        }
    }
    
    public var task: Task {
        switch self {
        case .list(let limit, let offset, let query):
            if !query.isEmpty{
                return .requestParameters(parameters: ["limit": limit, "offset": offset, "nameStartsWith": query], encoding: URLEncoding.default)
            }
            return .requestParameters(parameters: ["limit": limit, "offset": offset], encoding: URLEncoding.default)
        }
    }
    
    public var sampleData: Data {
        return returnedResponse(fileName: "Person")
    }
    
    
}
