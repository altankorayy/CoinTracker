//
//  Router.swift
//  CoinTrack
//
//  Created by Altan on 30.09.2023.
//

import Foundation
import UIKit

// -> EntryPoint

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entryPoint: EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class ExploreRouter: AnyRouter {
    var entryPoint: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = ExploreRouter()
        var view: AnyView = ExploreViewController()
        var presenter: AnyPresenter = ExplorePresenter()
        var interactor: AnyInteractor = ExploreInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        router.entryPoint = view as? EntryPoint
        
        return router
    }
    
}
