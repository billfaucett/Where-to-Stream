//
//  NHLMainView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/29/24.
//

import SwiftUI

struct NHLMainView: View {
    @ObservedObject var nhlViewControler = NHLViewController()
    let currentDate = Date()
    @State private var showStandings = false
    @State private var showSchedule = false
    @State private var showPlayerLeaders = false
    @State private var showGoalieLeaders = false
    @State private var showPlayerStatSummary = false
    
    func getYesterday() -> Date {
        let calendar = Calendar.current
        let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())!
        return yesterday
    }

    var body: some View {
        VStack {
            Text("NHL Standings, Stats and Schedule")
                .font(.title2)
            Image("NHL-Logo")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
        }
        Divider()
        VStack {
            Button("Get Current NHL Standings") {
                self.nhlViewControler.getNHLStandings(date: currentDate)
            }
        }
        .onReceive(nhlViewControler.$standings) { welcome in
            if let standings = welcome?.standings, !standings.isEmpty {
                showStandings = true
            }
        }
        .sheet(isPresented: $showStandings) {
            NHLStandingsView(standings: nhlViewControler.standings?.standings ?? [])
        }
        VStack {
            Button("Get Current NHL Schedule") {
                self.nhlViewControler.getNHLSchedule(date: currentDate)
            }
        }
        .onReceive(nhlViewControler.$schedule) { welcome in
            if let schedule = welcome?.gameWeek, !schedule.isEmpty {
                showSchedule = true
            }
        }
        .sheet(isPresented: $showSchedule) {
            NHLScheduleView(schedule: nhlViewControler.schedule?.gameWeek ?? [] )
        }
        VStack {
            Button("Get Yesterday's NHL Results") {
                self.nhlViewControler.getNHLSchedule(date: getYesterday())
            }
        }
        .onReceive(nhlViewControler.$schedule) { welcome in
            if let schedule = welcome?.gameWeek, !schedule.isEmpty {
                showSchedule = true
            }
        }
        .sheet(isPresented: $showSchedule) {
            NHLScheduleView(schedule: nhlViewControler.schedule?.gameWeek ?? [] )
        }
        VStack {
            NavigationLink (destination: NHLScheduleByDateView()) {
                Text("Get Schedue for Specific Date")
            }
        }
        VStack {
            Button("NHL Statistical Leaders - Skaters") {
                self.nhlViewControler.getNHLPlayerLeaders(category: "points", playerType: "skater")
                self.nhlViewControler.getNHLPlayerLeaders(category: "goals", playerType: "skater")
                self.nhlViewControler.getNHLPlayerLeaders(category: "assists", playerType: "skater")
            }
        }
        .onReceive(nhlViewControler.$leaders) { players in
            if let leaders = players?.points, !leaders.isEmpty {
                showPlayerLeaders = true
            }
        }
        .sheet(isPresented: $showPlayerLeaders) {
            NHLLeadersView(pointsLeaders: nhlViewControler.leaders?.points ?? [], goalsLeaders: nhlViewControler.leaders?.goals ?? [], assistsLeaders: nhlViewControler.leaders?.assists ?? [])
        }
        VStack {
            Button("NHL Statistical Leaders - Goalies") {
                self.nhlViewControler.getNHLPlayerLeaders(category: "wins", playerType: "goalie")
                self.nhlViewControler.getNHLPlayerLeaders(category: "goalsAgainstAverage", playerType: "goalie")
                self.nhlViewControler.getNHLPlayerLeaders(category: "savePctg", playerType: "goalie")
                self.nhlViewControler.getNHLPlayerLeaders(category: "shutouts", playerType: "goalie")
            }
        }
        .onReceive(nhlViewControler.$leaders) { players in
            if let leaders = players?.goalsAgainstAverage, !leaders.isEmpty {
                showGoalieLeaders = true
            }
        }
        .sheet(isPresented: $showGoalieLeaders) {
            NHLGoalieLeadersView(goalsAgainst: nhlViewControler.leaders?.goalsAgainstAverage ?? [], wins: nhlViewControler.leaders?.wins ?? [], shutouts: nhlViewControler.leaders?.shutouts ?? [], savePercentage: nhlViewControler.leaders?.savePctg ?? [])
        }
        VStack {
            Button("NHL Top 50 Scorers") {
                self.nhlViewControler.getNHLPlayerStatSummary()
            }
        }
        .onReceive(nhlViewControler.$playerStats) { stats in
            if let playerStats = stats, !(stats?.data.isEmpty)!{
                showPlayerStatSummary.toggle()
            }
        }
        .sheet(isPresented: $showPlayerStatSummary) {
            if let stats = nhlViewControler.playerStats {
                NHLPlayerStatListView(stats: stats)
            }
        }
    }
}

#Preview {
    NHLMainView()
}
