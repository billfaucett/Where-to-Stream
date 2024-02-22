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
    @Published var resultsWithOmbd : ProgramResults?
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
    
    func searchByTitle(title: String, completion: @escaping (Result<ProgramResults, Error>) -> Void) {
        apiManager.searchTitles(
            title: title, country: "us", showType: "all", outputLanguage: "en"
        ) { result in
            switch result {
            case .success(let jsonObject):
                if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []) {
                    print(jsonObject.values)
                    do {
                        ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                        let decoder = JSONDecoder()
                        let results = try decoder.decode(ProgramResults.self, from: jsonData)
                        self.findOmdbDetails(for: results) { result in
                            switch result {
                            case .success:
                                self.results = results
                                completion(.success(results))
                            case .failure(let error):
                                completion(.failure(error))
                            }
                        }
                    } catch {
                        completion(.failure(error))
                        print("Decoding JSON error! Error decoding JSON: \(error)")
                    }
                }
            case .failure(let error):
                completion(.failure(error))
                print("Error: \(error)")
            }
        }
    }

    
    func findOmdbDetails(for results: ProgramResults, completion: @escaping (Result<ProgramResults, Error>) -> Void) {
        self.resultsWithOmbd = results
        let dispatchGroup = DispatchGroup()

        for (index, result) in results.result.enumerated() {
            dispatchGroup.enter()
            omdbApiManager.searchTitles(imdbId: result.imdbId) { result in
                switch result {
                case .success(let jsonObject):
                    if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []) {
                        print(jsonObject.values)
                        do {
                            ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                            let decoder = JSONDecoder()
                            let omdb = try decoder.decode(OMdbModelResult.self, from: jsonData)
                            self.resultsWithOmbd!.result[index].omdbResult = omdb
                            dispatchGroup.leave()
                        } catch {
                            print("Decoding JSON error! Error decoding JSON: \(error)")
                            dispatchGroup.leave()
                        }
                    }
                case .failure(let error):
                    print("Error fetching omdb details: \(error)")
                    dispatchGroup.leave()
                }
            }
        }

        dispatchGroup.notify(queue: .main) {
            completion(.success(self.resultsWithOmbd!))
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
        if results != nil {
            for index in results!.result.indices {
                if results!.result[index].title.contains(title) {
                    getOmdbDetailsToArray(imdbId: results!.result[index].imdbId)
                }
            }
            print("Find Details - Array of omdb items Count: \(String(self.omdbResults.count)) ****")
            updateWithOmdbData()
        }
    }
    
    func findOmdbDetails(title: String, completion: @escaping () -> Void) {
        guard let results = results else {
            completion()
            return
        }

        let dispatchGroup = DispatchGroup()
        for index in results.result.indices {
            if results.result[index].title.contains(title) {
                dispatchGroup.enter()
                getOmdbDetailsToArray(imdbId: results.result[index].imdbId) {
                    dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) { [self] in
            print("Find Details - Array of omdb items Count: \(String(self.omdbResults.count)) ****")
            updateWithOmdbData()
            completion()
        }
    }

    func getOmdbDetailsToArray(imdbId: String, completion: @escaping () -> Void) {
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
                        completion()
                    } catch {
                        print ("Decoding JSON error! Error decoding JSON: \(error)")
                    }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
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
