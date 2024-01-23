//
//  APIManager.swift
//  Where to Stream
//
//  Created by William Faucett on 1/23/24.
//

import Foundation

struct APIManager {
    static let sharedApiManager = APIManager() //Singleton Instance
    
    private let baseURL = "https://streaming-availability.p.rapidapi.com"
    private let apiKey = "86f6c4b44emsha06a9a22c58af66p13e958jsnbcbd4643ea62"
    private let apiHost = "streaming-availability.p.rapidapi.com"
    
    private init() {}
    
    func searchTitles(title: String, country: String, showType: String, outputLanguage: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        // Construct the URL for the search endpoint with the provided parameters
        let urlString = "\(baseURL)/search/title?title=\(title)&country=\(country)&show_type=\(showType)&output_language=\(outputLanguage)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
    
    func searchPrimeVideo (keyword: String, completion: @escaping (Result<[String: Any], Error>) -> Void){
        let urlString = "\(baseURL)search/filters?services=prime.subscription&country=us&keyword=\(keyword)&output_language=en&order_by=original_title&genres_relation=and&show_type=all"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
}
