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
        static let baseUrl = "https://rest.coinapi.io/"
        static let apiKey = "b6ad4e89-1e12-4a00-9289-602601d0dcb9"
    }
    
    func fetchCryptoAsset(completion: @escaping(Result<[CryptoItems], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)v1/assets/?apikey=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard error == nil, let data = data else {
                completion(.failure(ApiError.NetworkFailed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([CryptoItems].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(ApiError.ParsingFailed))
            }
        }
        task.resume()
    }
    
    func fetchBitcoin(completion: @escaping(Result<[CryptoItems], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)v1/assets/btc/?apikey=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard error == nil, let data = data else {
                completion(.failure(ApiError.NetworkFailed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([CryptoItems].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(ApiError.ParsingFailed))
            }
        }
        task.resume()
    }
    
    func fetchEthereum(completion: @escaping(Result<[CryptoItems], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)v1/assets/eth/?apikey=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard error == nil, let data = data else {
                completion(.failure(ApiError.NetworkFailed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([CryptoItems].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(ApiError.ParsingFailed))
            }
        }
        task.resume()
    }
    
    func fetchXrp(completion: @escaping(Result<[CryptoItems], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)v1/assets/xrp/?apikey=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard error == nil, let data = data else {
                completion(.failure(ApiError.NetworkFailed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([CryptoItems].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(ApiError.ParsingFailed))
            }
        }
        task.resume()
    }
    
    func fetchSolana(completion: @escaping(Result<[CryptoItems], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)v1/assets/sol/?apikey=\(Constants.apiKey)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard error == nil, let data = data else {
                completion(.failure(ApiError.NetworkFailed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([CryptoItems].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(ApiError.ParsingFailed))
            }
        }
        task.resume()
    }
}
