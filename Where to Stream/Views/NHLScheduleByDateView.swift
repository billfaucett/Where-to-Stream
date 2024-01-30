//
//  ScheduleByDateView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/30/24.
//

import SwiftUI

struct NHLScheduleByDateView: View {
    @ObservedObject var nhlViewControler = NHLViewController()
    @State private var selectedDate = Date()
    @State var showSchedule = false
    
    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
            Button("Get Schedule") {
                self.nhlViewControler.getNHLSchedule(date: selectedDate)
            }
            .onReceive(nhlViewControler.$schedule) { welcome in
                if let schedule = welcome?.gameWeek, !schedule.isEmpty {
                    showSchedule = true
                }
            }
            .sheet(isPresented: $showSchedule) {
                NHLScheduleView(schedule: nhlViewControler.schedule?.gameWeek ?? [] )
            }
            .padding()
        }
    }
}

#Preview {
    NHLScheduleByDateView()
}
