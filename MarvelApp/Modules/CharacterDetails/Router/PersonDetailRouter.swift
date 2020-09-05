//
//  PersonDetailRouter.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import UIKit

class PersonDetailRouter: PersonDetailWireFrame {
    weak var view: UIViewController?
    
    // MARK: Static methods
    
    static func setupModule(person: Person) -> PersonDetailViewController {
        
        let viewController = R.storyboard.personDetail().instantiateInitialViewController() as! PersonDetailViewController
        let interactor = PersonDetailInteractor()
        let router = PersonDetailRouter()
        let presenter = PersonDetailPresenter(router: router, interactor: interactor, person: person)
        
        viewController.presenter =  presenter
        presenter.view = viewController
        router.view = viewController
        interactor.output = presenter
        
        return viewController
    }
    
    func openDetail(object: BaseWork) {
        let viewController = ItemDetailsRouter.assembleModule(object: object)
        self.view?.present(viewController, animated: true, completion: nil)
    }
}
