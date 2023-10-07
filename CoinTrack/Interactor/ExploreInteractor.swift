//
//  ExploreInteractor.swift
//  CoinTrack
//
//  Created by Altan on 30.09.2023.
//

import Foundation

// -> Presenter
// -> Api etc..

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    
    func downloadCryptos()
    func downloadNfts()
}

class ExploreInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        APICaller.shared.fetchCryptoAsset { [weak self] result in
            switch result {
            case .success(let cryptos):
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
            case .failure(let error):
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(error))
            }
        }
    }
    
    func downloadNfts() {
        APICaller.shared.fetchNftAsset { [weak self] result in
            switch result {
            case .success(let nfts):
                self?.presenter?.interactorDidDownloadNfts(result: .success(nfts))
            case .failure(let error):
                self?.presenter?.interactorDidDownloadNfts(result: .failure(error))
            }
        }
    }
}
