//
//  PersonDetailContract.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation

protocol PersonDetailView: class {
    var presenter: PersonDetailPresentation? {get set}
    
    func showDetails(sections:[(key: String, list: [PersonWorkItem], type: ItemType)])
    func setTitle(person: Person)
    func reloadPerson()
}

protocol PersonDetailPresentation: class {
    var view: PersonDetailView? {get set}
    var router: PersonDetailWireFrame {get set}
    var interactor: PersonDetailUseCase {get set}
    
    func onViewDidLoad()
    func onLoadDetailCell(item: PersonWorkItem, type: ItemType)
    func didSelectItem(item: BaseWork)
    
}

protocol PersonDetailUseCase: class {
    var output: PersonDetailInteractorOutput? {get set}
    
    func fetchSectionsData(person: Person)
    func fetchWork(item: PersonWorkItem, type: ItemType)
}

protocol PersonDetailInteractorOutput: class {
    func onFetched(sections: [(key: String, list: [PersonWorkItem], type: ItemType)])
    func onWorkSuccess(item: PersonWorkItem)
}

protocol PersonDetailWireFrame: class {
    func openDetail(object: BaseWork)
}
