//
//  ExploreEntity.swift
//  CoinTrack
//
//  Created by Altan on 30.09.2023.
//

import Foundation

// -> Struct

struct CryptoItems: Codable {
    let coins: [Coin]
    let nfts: [Nft]
}

struct Coin: Codable {
    let item: Item
}

struct Item: Codable {
    let id: String
    let name: String
    let symbol: String
    let large: String?
    let small: String?
    let price_btc: Float?
    let market_cap_rank: Int?
    let score: Int
}

struct Nft: Codable {
    let id: String
    let name: String
    let symbol: String
    let thumb: String
    let nft_contract_id: Int
    let native_currency_symbol: String
    let floor_price_in_native_currency: Float
    let floor_price_24h_percentage_change: Float
}
