//
//  StockAPIResponseModels.swift
//  ColorStocks
//
//  Created by Alexey Koryakin on 07.10.2021.
//

import Foundation

struct Quote: Codable {
    let change: Float
    let changePercent: Float
    let companyName: String
    let currency: String
    let latestPrice: Float
}

struct News: Codable {
    let headline: String
    let summary: String
    let url: String
}

struct StatsBasic: Codable {
    let companyName: String
    let marketcap: Double
    let week52high: Float
    let week52low: Float
    let peRatio: Double
}
