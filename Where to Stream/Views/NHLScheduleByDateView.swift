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
    
    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
            Button("Get Schedule") {
                self.nhlViewControler.getNHLSchedule(date: selectedDate)
                NHLScheduleView(schedule: nhlViewControler.schedule?.gameWeek ?? [])
            }
            .padding()
        }
    }
}

#Preview {
    NHLScheduleByDateView()
}
