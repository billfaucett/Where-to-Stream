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
                            //self.getOmdbDetails(title: title)
                            self.findOmdbDetails(title: title)
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
                        } catch {
                            print ("Decoding JSON error! Error decoding JSON: \(error)")
                        }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getOmdbDetailsToArray (imdbId: String){
        omdbApiManager.searchTitles(
            imdbId: imdbId
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
                            print("Array of omdb items Count: \(String(self.omdbResults.count)) ****")
                        } catch {
                            print ("Decoding JSON error! Error decoding JSON: \(error)")
                        }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func findOmdbDetails (title: String) {
        if let titles = results {
            for index in results!.result.indices {
                if results!.result[index].title.contains(title) {
                    getOmdbDetailsToArray(imdbId: results!.result[index].imdbId)
                }
            }
            print("Find Details - Array of omdb items Count: \(String(self.omdbResults.count)) ****")
            updateWithOmdbData()
        }
    }
    
    func updateWithOmdbData () {
        print("Update with Data - Array of omdb items Count: \(String(self.omdbResults.count)) ****")
        DispatchQueue.main.async {
            for index in self.results!.result.indices {
                let title = self.results?.result[index]
                let omdb = self.omdbResults.first {$0.imdbID == title?.imdbId}
                DispatchQueue.main.async {
                    self.results?.result[index].omdbResult = omdb
                }
            }
        }
    }
}
