//
//  PersonListInteractor.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//


import Foundation
import Moya

class PersonListInteractor: PersonListUseCase{
    
    var output: PersonListInteractorOutput?
    
    private var api: MarvelAPI
    private let limit = 20
    
    
    init(api:MarvelAPI = MarvelAPI(baseURL: Constants.API.baseAddress, publicKey: Constants.API.publicKey, privateKey: Constants.API.privateKey)) {
        self.api = api
    }
    
    func fetchPersonList(query: String, offset: Int) {
        self.api.characters.request(.list(limit: limit, offset: offset, query: query)) { (response) in
            switch response {
            case .success(let result):
                if let array = result.mapMappable(object: Person.self) {
                    self.output?.onFetch(result: .success(object: array))
                }else{
                    self.output?.onFetch(result: .failure(message: R.string.localizable.defaultError()))
                }
            case .failure(let error):
                self.output?.onFetch(result: .failure(message: "\(R.string.localizable.defaultError()) \n Error: \(error.localizedDescription)"))
            }
        }
    }
    
}
