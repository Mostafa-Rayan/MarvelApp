//
//  MarvelAPIType.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Moya
import ObjectMapper

protocol MarvelAPIType: TargetType{
    var useAuth: Bool {get}
}

extension MarvelAPIType{
    
    public var baseURL: URL {return MarvelAPI.baseURL}
    public var method: Moya.Method {return .get}
    public var task: Task {return .requestPlain}
    public var headers: [String : String]? {return nil}
    public var useAuth: Bool {return true}
    
    func returnedResponse(fileName: String) -> Data! {
        let path = Bundle.main.path(forResource: fileName, ofType: "json")
        return try? Data(contentsOf: URL(fileURLWithPath: path!))
    }
}

extension Response {
    
    func mapMappable<T:Mappable>(object: T.Type) -> [T]? {
        do{
            let dicJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
            if let data = dicJson["data"] as? [String: Any],
                let results = data["results"] as? [[String: Any]] {
                var arrayMovies = [T]()
                for item in results {
                    if let person = object.init(JSON: item){
                        arrayMovies.append(person)
                    }
                }
                return arrayMovies
            }
            return nil
        }catch{
            return nil
        }
    }
}
