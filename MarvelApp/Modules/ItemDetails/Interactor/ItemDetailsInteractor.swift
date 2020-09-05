//
//  ItemDetailsInteractor.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation

class ItemDetailsInteractor: ItemDetailsUseCase {
    
    weak var output: ItemDetailsInteractorOutput?
    
    func load(object: BaseWork) {
        if let obj = object as? Comic {
            self.output?.showDetails(for: obj)
            return
        }
        if let obj = object as? Event {
            self.output?.showDetails(for: obj)
            return
        }
        if let obj = object as? Serie {
            self.output?.showDetails(for: obj)
            return
        }
        if let obj = object as? Story {
            self.output?.showDetails(for: obj)
            return
        }
    }
}
