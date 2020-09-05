//
//  MarvelAPIAuthPlugin.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Moya

struct MarvelAPIAuthPlugin: PluginType {
    
    let authenticateParameters: [String:String]
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let marvelTarget = target as? MarvelAPIType,
            let urlRequest = request.urlRequest else{
                return request
        }
        
        if marvelTarget.useAuth{
            do{
                let queryParameters = authenticateParameters
                var queryRequest = try URLEncoding(destination: .queryString).encode(urlRequest, with: queryParameters)
                queryRequest.cachePolicy = .useProtocolCachePolicy
                return queryRequest
            }catch{
                return request
            }
        }
        return request
    }
}
