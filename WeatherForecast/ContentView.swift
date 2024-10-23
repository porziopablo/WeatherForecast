//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Pablo Porzio on 23/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WeekForecast(startDate: .now, endDate: .now, avgLow: 60, avgHigh: 80, rainyDays: 1, sunnyDays: 4)
            ScrollView(.horizontal) {
                HStack(alignment: .center, spacing: 20) {
                    DayForecast(day: "Mon", isRainy: false, high: 70, low:50)
                    DayForecast(day: "Tue", isRainy: true, high: 60, low:40)
                    DayForecast(day: "Wed", isRainy: false, high: 80, low:60)
                    DayForecast(day: "Thu", isRainy: false, high: 90, low:80)
                    DayForecast(day: "Fri", isRainy: false, high: 100, low:90)
                }
                .padding(20)
        }

    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        isRainy ? "cloud.rain.fill" : "sun.max.fill"
    }
    
    var iconColor: Color {
        isRainy ? Color.blue : Color.yellow
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.largeTitle)
                .padding(5)
            Text("\(high)º")
                .fontWeight(Font.Weight.semibold)
                .foregroundStyle(high >= 80 ? Color.red : .primary)
            Text("\(low)º")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))

    }
}

struct WeekForecast: View {
    let startDate: Date
    let endDate: Date
    let avgLow: Int
    let avgHigh: Int
    let rainyDays: Int
    let sunnyDays: Int
    
    var body: some View {
        VStack {
            Text("Weekly Forecast")
                .font(.title)
            Text("\(startDate.formatted(date: .abbreviated, time: .omitted)) - \(endDate.formatted(date: .abbreviated, time: .omitted))")
                .font(.headline)
                .padding(5)
            Text("Min: \(avgLow)º - Max: \(avgHigh)º")
                .fontWeight(Font.Weight.semibold)
        }
        .padding()
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
    }
}
