//
//  NHLApiManager.swift
//  Where to Stream
//
//  Created by William Faucett on 1/29/24.
//

import Foundation

struct NHLApiManager {
    static let nhlApiMgr = NHLApiManager() //Singleton Instance
    
    private let baseURL = "https://api-web.nhle.com/"
    private let apiKey = ""
    private let apiHost = "api-web.nhle.com/.com"
    
    private init() {}
    
    func getStandings(date: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        // Construct the URL for the search endpoint with the provided parameters
        let urlString = "\(baseURL)v1/standings/\(date)"
        print(urlString)
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
    
    func getSchedule(date: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        // Construct the URL for the search endpoint with the provided parameters
        let urlString = "\(baseURL)v1/schedule/\(date)"
        print(urlString)
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
    
    func getBoxScore(gameId: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        // Construct the URL for the search endpoint with the provided parameters
        let urlString = "\(baseURL)v1/gamecenter/\(gameId)/boxscore"
        print(urlString)
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
    
    func getPlayByPlay(gameId: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        // Construct the URL for the search endpoint with the provided parameters
        let urlString = "\(baseURL)v1/gamecenter/\(gameId)/play-by-play"
        print(urlString)
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
    
    func getSkaterLeaders(category: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        // Construct the URL for the search endpoint with the provided parameters
        let urlString = "\(baseURL)v1/skater-stats-leaders/current?/categories=\(category)&limit=5"
        print(urlString)
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
    
    func getPlayerStatLeaders(playerType: String, category: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        // Construct the URL for the search endpoint with the provided parameters
        let urlString = "\(baseURL)v1/\(playerType)-stats-leaders/current?/categories=\(category)&limit=5"
        print(urlString)
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        ModelHelpers.NetworkRequestManager.makeGETRequest(url: url, apiKey: apiKey, apiHost: apiHost, completion: completion)
    }
}
