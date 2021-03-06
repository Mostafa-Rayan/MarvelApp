//
//  ItemDetailsContract.swift
//  MarvelApp
//
//  Created by Mostafa Rayan on 9/4/20.
//

import UIKit

protocol ItemDetailsView: class {
    var presenter: ItemDetailsPresentation! { get set }
    
    func showDetails(for comic: Comic)
    func showDetails(for event: Event)
    func showDetails(for serie: Serie)
    func showDetails(for story: Story)
}

protocol ItemDetailsPresentation: class {
    var view: ItemDetailsView? { get set }
    
    func viewDidLoad()
    func load(object: BaseWork)
}

protocol ItemDetailsUseCase: class {
    var output: ItemDetailsInteractorOutput? { get set }
    func load(object: BaseWork)
}

protocol ItemDetailsInteractorOutput: class {
    func showDetails(for comic: Comic)
    func showDetails(for event: Event)
    func showDetails(for serie: Serie)
    func showDetails(for story: Story)
}

protocol ItemDetailsWireframe: class {
    static func assembleModule(object: BaseWork) -> UIViewController
}
