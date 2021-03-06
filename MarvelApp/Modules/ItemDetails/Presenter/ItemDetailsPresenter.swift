//
//  ItemDetailsPresenter.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation

class ItemDetailsPresenter : ItemDetailsPresentation {
    weak var view: ItemDetailsView?
    var interactor: ItemDetailsUseCase!
    var object: BaseWork!
    
    func viewDidLoad() {
        self.load(object: object)
    }
    
    func load(object: BaseWork) {
        self.object = object
        self.interactor.load(object: object)
    }
}

extension ItemDetailsPresenter: ItemDetailsInteractorOutput {
    func showDetails(for comic: Comic) {
        self.view?.showDetails(for: comic)
    }
    func showDetails(for event: Event) {
        self.view?.showDetails(for: event)
    }
    func showDetails(for serie: Serie){
        self.view?.showDetails(for: serie)
    }
    func showDetails(for story: Story){
        self.view?.showDetails(for: story)
    }
}
