//
//  OmdbAPIManager.swift
//  Where to Stream
//
//  Created by William Faucett on 1/28/24.
//

import Foundation

struct OmdbAPIManager {
    static let omdbApiManager = OmdbAPIManager() //Singleton Instance
    
    private let baseURL = "https://www.omdbapi.com"
    private let apiKey = "edc05339"
    private let apiHost = "omdbapi.com"
    
    private init() {}
    
    func searchTitles(title: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        // Construct the URL for the search endpoint with the provided parameters
        let urlString = "\(baseURL)/?apikey=\(apiKey)&t=\(title)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        //ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost) { result in
            switch result {
            case .success(let jsonObject):
                if let response = jsonObject["Response"] as? String, response == "False" {
                    completion(.failure(NSError(domain: "Result not found", code: 0, userInfo: nil)))
                    return
                }
                completion(.success(jsonObject))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
