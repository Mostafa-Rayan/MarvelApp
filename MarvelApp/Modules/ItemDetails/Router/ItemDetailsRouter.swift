//
//  ItemDetailsRouter.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import Foundation
import UIKit

class ItemDetailsRouter: ItemDetailsWireframe {
    
    static func assembleModule(object: BaseWork) -> UIViewController {
        
        let view = R.storyboard.itemDetails().instantiateInitialViewController() as! ItemDetailsViewController
        let presenter = ItemDetailsPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = ItemDetailsInteractor()
        presenter.object = object
        presenter.interactor.output = presenter
        
        return view
    }
}
