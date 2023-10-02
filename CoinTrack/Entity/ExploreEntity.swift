//
//  ExploreEntity.swift
//  CoinTrack
//
//  Created by Altan on 30.09.2023.
//

import Foundation

// -> Struct

struct CryptoItems: Codable {
    let asset_id: String
    let name: String?
    let volume_1day_usd: Double?
    let price_usd: Float?
    let id_icon: String?
}
