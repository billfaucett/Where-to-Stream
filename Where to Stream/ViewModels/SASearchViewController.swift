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
                            //self.getOmdbDetails(title: title, num: 0)
                            print("***********")
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
    
    func getOmdbDetails (title: String, num: Int){
        guard let titles = results else {
            return
        }
        
        for index in titles.result.indices {
            let myTitle = titles.result[index].title
            
            if myTitle.contains(title) {
                omdbApiManager.searchTitles(
                    title: myTitle
                ) { result in
                    switch result {
                    case .success(let jsonObject):
                        if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                            print(jsonObject.values)
                            do{
                                ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                                let decoder = JSONDecoder()
                                let omdbItem = try decoder.decode(OMdbModelResult.self, from: jsonData)
                                self.omdbResults.append(omdbItem)
                            } catch {
                                print ("Decoding JSON error! Error decoding JSON: \(error)")
                            }
                        }
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
            }
        }
    }
}
