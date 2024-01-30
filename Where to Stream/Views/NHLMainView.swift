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
    
    func getYesterday() -> Date {
        let calendar = Calendar.current
        let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())!
        return yesterday
    }

    var body: some View {
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
    }
}

#Preview {
    NHLMainView()
}
/*if showStandings {
 NHLStandingsView(standings: nhlViewControler.welcome!.standings)
}*/
