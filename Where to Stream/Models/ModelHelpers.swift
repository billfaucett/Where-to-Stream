//
//  ModelHelpers.swift
//  Where to Stream
//
//  Created by William Faucett on 1/26/24.
//

import Foundation
import SwiftUI

struct ModelHelpers{
    static let modelHelper = ModelHelpers() //Singleton Instance
    
    func jsonDataToString (data: Data) {
        if let jsonString = String(data: data, encoding: .utf8) {
            print("***Starting to Write JSON***")
            print("JSON String: \(jsonString)")
            print("***End Writing JSON***")
        } else {
            print("Failed to convert JSON data to string.")
        }
    }
    
    enum StreamingServiceNames: String {
        case prime = "Amazon Prime Video"
        case apple = "Apple TV+"
        case netflix = "Netflix"
        case hulu = "Hulu"
        case peacock = "Peacock"
    }

    struct NetworkRequestManager {
        static func makeGETRequest(url: URL, apiKey: String, apiHost: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = [
                "X-RapidAPI-Key": apiKey,
                "X-RapidAPI-Host": apiHost
            ]
            
            // Create a URLSessionDataTask to make the GET request
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let responseData = data else {
                    completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                    return
                }
                
                do {
                    if let jsonObject = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as? [String: Any] {
                        completion(.success(jsonObject))
                    } else {
                        completion(.failure(NSError(domain: "Invalid JSON", code: 0, userInfo: nil)))
                    }
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString.replacingOccurrences(of: "\\/", with: "/")) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(uiImage)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return(self * divisor).rounded() / divisor
    }
}
