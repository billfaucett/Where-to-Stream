//
//  TitleSearchService.swift
//  Where to Stream
//
//  Created by William Faucett on 2/20/24.
//

import Foundation

class TitleSearchService {
    private let baseURL: String
    private let apiKey: String
    private let apiHost: String
    
    init(baseURL: String, apiKey: String, apiHost: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.apiHost = apiHost
    }
    
    func searchTitles(title: String, country: String, showType: String, outputLanguage: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let urlString = "\(baseURL)/search/title?title=\(title)&country=\(country)&show_type=\(showType)&output_language=\(outputLanguage)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        makeGETRequest(url: url, completion: completion)
    }
    
    func searchTitle(title: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let urlString = "\(baseURL)/?apikey=\(apiKey)&t=\(title)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        makeGETRequest(url: url, completion: completion)
    }
    
    private func makeGETRequest(url: URL, completion: @escaping (Result<[String: Any], Error>) -> Void) {
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

