//
//  NHLViewController.swift
//  Where to Stream
//
//  Created by William Faucett on 1/29/24.
//

import Foundation
import SwiftUI

class NHLViewController : ObservableObject {
    let nhlApiMgr = NHLApiManager.nhlApiMgr
    @Published var standings: Standings?
    @Published var schedule: Schedule?
    @Published var boxScore: GameDetails?
    @Published var playByPlay: PlayByPlay?
    @Published var leaders: PlayerLeadersResponse?
    
    func getNHLStandings(date: Date){
        let formattedDate = formatDate(date)
        
        nhlApiMgr.getStandings(date: formattedDate) { result in
            switch result {
            case .success(let jsonObject):
                            if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                                print(jsonObject.values)
                                    do{
                                        ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                                        let decoder = JSONDecoder()
                                        self.standings = try decoder.decode(Standings.self, from: jsonData)
                                    } catch {
                                        print ("Decoding JSON error! Error decoding JSON: \(error)")
                                    }
                            }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getNHLSchedule(date: Date) {
        let formattedDate = formatDate(date)
        
        nhlApiMgr.getSchedule(date: formattedDate) { result in
            switch result {
            case .success(let jsonObject):
                            if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                                print(jsonObject.values)
                                    do{
                                        ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                                        let decoder = JSONDecoder()
                                        self.schedule = try decoder.decode(Schedule.self, from: jsonData)
                                    } catch {
                                        print ("Decoding JSON error! Error decoding JSON: \(error)")
                                    }
                            }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getBoxScore(gameId: Int) {
        let id = String(gameId)
        
        nhlApiMgr.getBoxScore(gameId: id) { result in
            switch result {
            case .success(let jsonObject):
                            if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                                print(jsonObject.values)
                                    do{
                                        ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                                        let decoder = JSONDecoder()
                                        self.boxScore = try decoder.decode(GameDetails.self, from: jsonData)
                                        self.getPlayByPlay(gameId: gameId)
                                    } catch {
                                        print ("Decoding JSON error! Error decoding JSON: \(error)")
                                    }
                            }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getPlayByPlay(gameId: Int) {
        let id = String(gameId)
        
        nhlApiMgr.getPlayByPlay(gameId: id) { result in
            switch result {
            case .success(let jsonObject):
                            if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                                print(jsonObject.values)
                                    do{
                                        ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                                        let decoder = JSONDecoder()
                                        self.playByPlay = try decoder.decode(PlayByPlay.self, from: jsonData)
                                    } catch {
                                        print ("Decoding JSON error! Error decoding JSON: \(error)")
                                    }
                            }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        
        return dateformatter.string(from: date)
    }
    
    func getNHLSkaterLeaders(category: String){
        
        nhlApiMgr.getSkaterLeaders(category: category) { result in
            switch result {
            case .success(let jsonObject):
                            if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: []){
                                print(jsonObject.values)
                                    do{
                                        ModelHelpers.modelHelper.jsonDataToString(data: jsonData)
                                        let decoder = JSONDecoder()
                                        self.leaders = try decoder.decode(PlayerLeadersResponse.self, from: jsonData)
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
