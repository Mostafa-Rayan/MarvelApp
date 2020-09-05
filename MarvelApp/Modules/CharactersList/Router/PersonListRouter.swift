//
//  PersonListRouter.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import UIKit

class PersonListRouter: PersonListWireFrame {
    
    var viewController: UIViewController?
    
    func openDetail(person: Person) {
        let viewController = PersonDetailRouter.setupModule(person: person)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    static func assembleModule() -> UINavigationController {
        
        let navigation = R.storyboard.personList().instantiateInitialViewController() as! UINavigationController
        let viewC = navigation.viewControllers.first as! PersonListViewController
        let interactor = PersonListInteractor()
        let router = PersonListRouter()
        let presenter = PersonListPresenter(router: router, interactor: interactor)
        
        viewC.presenter = presenter
        presenter.view = viewC
        interactor.output = presenter
        
        router.viewController = viewC
        
        return navigation
        
    }
}
