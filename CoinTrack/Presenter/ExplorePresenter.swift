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
    
    func interactorDidDownloadCrypto(result: Result<[Item], Error>)
    func interactorDidDownloadNfts(result: Result<[Nft], Error>)
}

class ExplorePresenter: AnyPresenter {
    var view: AnyView?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
            interactor?.downloadNfts()
        }
    }
    
    var router: AnyRouter?
    
    func interactorDidDownloadCrypto(result: Result<[Item], Error>) {
        switch result {
        case .success(let items):
            view?.update(with: items)
        case .failure(let error):
            view?.updateError(with: error.localizedDescription)
        }
    }
    
    func interactorDidDownloadNfts(result: Result<[Nft], Error>) {
        switch result {
        case .success(let nfts):
            view?.updateNft(with: nfts)
        case .failure(let error):
            view?.updateError(with: error.localizedDescription)
        }
    }
}
