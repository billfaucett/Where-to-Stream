//
//  WatchModeAPIManager.swift
//  Where to Stream
//
//  Created by William Faucett on 1/25/24.
//

import Foundation
import UIKit

struct WatchModeAPIManager {
    static let sharedWatchModeApiMgr = WatchModeAPIManager()
    
    private let baseURL = "https://watchmode.p.rapidapi.com"
    private let apiKey = "86f6c4b44emsha06a9a22c58af66p13e958jsnbcbd4643ea62"
    private let apiHost = "watchmode.p.rapidapi.com"
    
    private init() {}
    
    func searchByTitle (title: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let urlString = "\(baseURL)/search/?search_field=name&search_value=\(title)&type=tv"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
    
    func getTitleDetails (id: Int, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let urlString = "\(baseURL)/title/\(id)/details/?language=EN"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
    
    func getStreamingSources (id: Int, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        let urlString = "\(baseURL)/title/\(id)/sources/"
        print("url \n ****** \(urlString) ******** getStreamingSources \n")
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
}
