//
//  APICaller.swift
//  CoinTrack
//
//  Created by Altan on 1.10.2023.
//

import Foundation

class APICaller {
    
    static let shared = APICaller()
    
    enum ApiError: Error {
        case NetworkFailed
        case ParsingFailed
    }
    
    struct Constants {
        static let baseUrl = "https://api.coingecko.com"
        static let apiKey = "CG-RmUfkCd8FmFeqbDD6TDao2f5"
    }
    
    func fetchCryptoAsset(completion: @escaping(Result<[Item], Error>) -> Void) {        
        guard let url = URL(string: "\(Constants.baseUrl)/api/v3/search/trending/?apikey=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard error == nil, let data = data else {
                completion(.failure(ApiError.NetworkFailed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(CryptoItems.self, from: data)
                let items = result.coins.map { $0.item }
                completion(.success(items))
            } catch let error {
                print("JSON decoding error: \(error)")
                completion(.failure(ApiError.ParsingFailed))
            }
        }
        task.resume()
    }
    
    func fetchNftAsset(completion: @escaping(Result<[Nft], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/api/v3/search/trending/?apikey=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(ApiError.NetworkFailed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(CryptoItems.self, from: data)
                let items = result.nfts
                completion(.success(items))
            } catch let error {
                print("JSON decoding error: \(error)")
                completion(.failure(ApiError.ParsingFailed))
            }
        }
        task.resume()
    }
}
