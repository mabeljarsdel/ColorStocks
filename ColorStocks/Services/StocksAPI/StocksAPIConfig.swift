//
//  StocksAPIConfig.swift
//  ColorStocks
//
//  Created by Alexey Koryakin on 07.10.2021.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var token: URLQueryItem { get }
}

enum StocksAPI: Endpoint {
    case getPrice(ticker: String)
    case getQuote(ticker: String)
    case getBasicStats(ticker: String)
    case getNews(ticker: String)

    var baseURL: String {
        switch self {
        default:
            return "sandbox.iexapis.com"
        }
    }

    var path: String {
        switch self {
        case .getPrice(let ticker):
            return "/stable/stock/\(ticker)/price"
        case .getQuote(let ticker):
            return "/stable/stock/\(ticker)/quote"
        case .getBasicStats(let ticker):
            return "/stable/stock/\(ticker)/stats"
        case .getNews(let ticker):
            return "/stable/time-series/news/\(ticker)"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getPrice(let ticker), .getQuote(let ticker), .getBasicStats(let ticker), .getNews(let ticker):
            return [token]
        }
    }
        var token: URLQueryItem {
            // Тестовый ключ для sandbox'а, поэтому хранится в открытом доступе
            return URLQueryItem(name: "token", value: "Tpk_7d60e7252b564e529b85ccbd7dabc185")


    }
}
