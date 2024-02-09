//
//  SASearchViewController.swift
//  Where to Stream
//
//  Created by William Faucett on 1/26/24.
//

import Foundation

class SASearchViewController : ObservableObject {
    let apiManager = APIManager.sharedApiManager
    let omdbApiManager = OmdbAPIManager.omdbApiManager
    @Published var results : ProgramResults?
    @Published var omdbResult : OMdbModelResult?
    var omdbResults : [OMdbModelResult] = []
    @Published var shouldClearDetails = false
    
    func searchByTitle (title: String) {
        apiManager.searchTitles(
            title: title, country: "us", showType: "all", outputLanguage: "en"
        ) { result in
            switch result {
            case .success(let jsonObject):
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                    print(jsonObject.values)
                        do{
                            ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                            let decoder = JSONDecoder()
                            self.results = try decoder.decode(ProgramResults.self, from: jsonData)
                            self.getOmdbDetails(title: title)
                            self.findOmdbDetails()
                            self.updateWithOmdbData()
                        } catch {
                            print ("Decoding JSON error! Error decoding JSON: \(error)")
                        }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getOmdbDetails (title: String){
        omdbApiManager.searchTitles(
            title: title
        ) { result in
            switch result {
            case .success(let jsonObject):
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                    print(jsonObject.values)
                        do{
                            ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                            let decoder = JSONDecoder()
                            self.omdbResult = try decoder.decode(OMdbModelResult.self, from: jsonData)
                            //let omdb = try decoder.decode(OMdbModelResult.self, from: jsonData)
                            //self.omdbResults.append(omdb)
                        } catch {
                            print ("Decoding JSON error! Error decoding JSON: \(error)")
                        }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getOmdbDetailsToArray (title: String){
        omdbApiManager.searchTitles(
            title: title
        ) { result in
            switch result {
            case .success(let jsonObject):
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                    print(jsonObject.values)
                        do{
                            ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                            let decoder = JSONDecoder()
                            let omdb = try decoder.decode(OMdbModelResult.self, from: jsonData)
                            self.omdbResults.append(omdb)
                        } catch {
                            print ("Decoding JSON error! Error decoding JSON: \(error)")
                        }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func findOmdbDetails () {
        if let titles = results {
            for index in results!.result.indices {
                getOmdbDetailsToArray(title: results!.result[index].title)
            }
        }
    }
    
    func updateWithOmdbData () {
        for index in results!.result.indices {
            let title = results?.result[index]
            let omdb = omdbResults.first {$0.imdbID == title?.imdbId}
            results?.result[index].omdbResult = omdb
        }
    }
}

extension ProgramDetails {
    mutating func getOmdbInfo (omdbApiManager: OmdbAPIManager) {
        omdbApiManager.searchTitles(title: title) { result in
            let jsonObject = result
            if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []) {
                do{
                    ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                    let decoder = JSONDecoder()
                    let omdb = try decoder.decode(OMdbModelResult.self, from: jsonData)
                    //updateOMDB(result: omdb)
                } catch {
                    print("Decoding JSON error! Error decoding JSON: \(error)")
                }
            }
        }
    }
    
    mutating func updateOMDB (result: OMdbModelResult) {
        self.omdbResult = result
    }
}
