//
//  WMSearchViewControler.swift
//  Where to Stream
//
//  Created by William Faucett on 1/25/24.
//

import SwiftUI
import UIKit
import Foundation

enum DecodeResult<T> {
    case success(T)
    case failure(Error)
}

class WMSearchViewControler: ObservableObject {
    let apiManager = WatchModeAPIManager.sharedWatchModeApiMgr
    @Published var results: WatchSearchResult?
    @Published var tvSeriesDetails: TVSeriesDetails?
    @Published var streamingSourceDetails: StreamingSources?
    
    func searchByTitle (title: String) {
        apiManager.searchByTitle (
            title: title
        ) { result in
            switch result {
            case .success(let jsonObject):
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                    print(jsonObject.values)
                        do{
                            ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                            let decoder = JSONDecoder()
                            self.results = try decoder.decode(WatchSearchResult.self, from: jsonData)
                            print (self.results?.title_results.first?.name ?? "default value")
                            print (self.results?.title_results.first?.id ?? "none")
                            let resultId = self.results?.title_results.first?.id ?? 0
                            if (resultId != 0){
                                self.getTitleDetails(id: resultId)
                                self.getStreamingSources(id: resultId)
                            }
                            
                        } catch {
                            print ("Decoding JSON error! Error decoding JSON: \(error)")
                            //completion(.failure(error))
                        }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getTitleDetails (id: Int){
        apiManager.getTitleDetails(
            id: id
        ) { result in
            switch result {
            case .success(let jsonObject):
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                    print(jsonObject.values)
                        do{
                            ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                            let decoder = JSONDecoder()
                            self.tvSeriesDetails = try decoder.decode(TVSeriesDetails.self, from: jsonData)
                            print (self.results?.title_results.first?.name ?? "No Title")
                            print (self.tvSeriesDetails?.networkNames ?? "default value")
                            
                        } catch {
                            print ("Decoding JSON error! Error decoding JSON: \(error)")
                        }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getStreamingSources (id: Int){
        apiManager.getStreamingSources(
            id: id
        ) { result in
            switch result {
            case .success(let jsonObject):
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                    print(jsonObject.values)
                        do{
                            ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                            let decoder = JSONDecoder()
                            self.streamingSourceDetails = try decoder.decode(StreamingSources.self, from: jsonData)
                            print (self.streamingSourceDetails?.streamingSources.first?.name ?? "No Title")
                            
                        } catch {
                            print ("Decoding JSON error! Error decoding JSON: \(error)")
                        }
                }
            case .failure(let error):
                print("Error With Get Streaming Sources!!!!!!: \(error)")
            }
        }
    }
}
