//
//  MarvelAPI.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Moya

public class MarvelAPI{
    
    //MARK:- Variables
    var baseURL, publicKey, privateKey: String
    
    //MARK:- Class Initialization
    init(baseURL: String, publicKey: String, privateKey: String) {
        self.baseURL = baseURL
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    static let baseURL = URL(string: Constants.API.baseAddress)!
    
    //MARK:- Moya's Providers
    public var characters: MoyaProvider<CharacterService> {
        return createProvider(for: CharacterService.self)
    }
    
    public var comics: MoyaProvider<ComicService> {
        return createProvider(for: ComicService.self)
    }
    
    public var series: MoyaProvider<SerieService> {
        return createProvider(for: SerieService.self)
    }
    
    public var stories: MoyaProvider<StoryService> {
        return createProvider(for: StoryService.self)
    }
    
    public var events: MoyaProvider<EventService> {
        return createProvider(for: EventService.self)
    }
    
    //MARK:- Private Functions
    private func createProvider<T: MarvelAPIType>(for target: T.Type) -> MoyaProvider<T> {
        let endpointClosure = createEndpointClosure(for: target)
        
        var plugins = [PluginType]()
        if Constants.debugMode {
            plugins.append(NetworkLoggerPlugin())
        }
        
        plugins.append(MarvelAPIAuthPlugin(authenticateParameters: MarvelAPI.authenticationParameters(privateKey: self.privateKey, publicKey: self.publicKey)))
        
        return MoyaProvider<T>(endpointClosure: endpointClosure, plugins: plugins)
    }
    
    private func createEndpointClosure<T: TargetType>(for target: T.Type) -> MoyaProvider<T>.EndpointClosure {
        let endpointClosure = { (target: T) -> Endpoint in
            let endpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return endpoint
        }
        
        return endpointClosure
    }
    
    //MARK:- Functions from class type
    class func authenticationParameters(privateKey: String, publicKey: String, timestamp:String = String(Date().timeIntervalSince1970)) -> [String:String] {
        
        let hash = self.requestHash(timestamp: timestamp, apiPrivateKey: privateKey, apiPublicKey: publicKey)
        let autenticateParameters = ["ts": timestamp, "apikey": publicKey, "hash": hash]
        
        return autenticateParameters
    }
    
    class func requestHash(timestamp: String, apiPrivateKey: String, apiPublicKey: String) -> String {
        let string = timestamp + apiPrivateKey + apiPublicKey
        let hash = string.getMD5()
        return hash.map { String(format: "%02hhx", $0) }.joined()
    }
}
