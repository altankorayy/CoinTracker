//
//  ExplorePresenter.swift
//  CoinTrack
//
//  Created by Altan on 30.09.2023.
//

import Foundation

// -> View, Interactor, Router

protocol AnyPresenter {
    var view: AnyView? {get set}
    var interactor: AnyInteractor? {get set}
    var router: AnyRouter? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[CryptoItems], Error>)
}

class ExplorePresenter: AnyPresenter {
    var view: AnyView?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var router: AnyRouter?
    
    func interactorDidDownloadCrypto(result: Result<[CryptoItems], Error>) {
        switch result {
        case .success(let cryptoItems):
            view?.update(with: cryptoItems)
        case .failure(let error):
            view?.updateError(with: error.localizedDescription)
        }
    }
    
}
