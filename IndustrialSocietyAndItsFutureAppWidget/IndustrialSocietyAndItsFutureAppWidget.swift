//
//  IndustrialSocietyAndItsFutureAppWidget.swift
//  IndustrialSocietyAndItsFutureAppWidget
//
//  Created by Cipher Lunis on 12/30/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        // Generate a timeline consisting of one day, starting from the current date.
        let currentDate = Date()
        let timeline = Timeline(entries: [SimpleEntry(date: Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!, configuration: configuration)], policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct IndustrialSocietyAndItsFutureAppWidgetEntryView : View {
    var entry: Provider.Entry
    
    let isIPad = UIDevice.current.userInterfaceIdiom == .pad
    var sentenceList = TextParserHelper.parseText()
    let widgetBGNum = Int.random(in: 1...3)

    var body: some View {
        ZStack {
            Image("WidgetBG\(widgetBGNum)")
                .resizable()
                .aspectRatio(contentMode: .fill)
//            StrokedText(strokeColor: .black, fillColor: .blue, fontSize: isIPad ? 40 : 20, fontName: "Arial", strokeWidth: 5, text: "\"\(sentenceList[Int.random(in: 0...sentenceList.count)])\"")
            Text("\"\(sentenceList[Int.random(in: 0...sentenceList.count)])\"")
                .fontWeight(.bold)
                .foregroundColor(widgetBGNum == 1 ? .white : widgetBGNum == 2 ? .purple : .white )
                .font(.system(size: isIPad ? 40 : 20))
                .shadow(radius: 10)
                .minimumScaleFactor(0.5)
                .padding(.leading)
                .padding(.trailing)
                .kerning(0.8)
        }
    }
}

struct IndustrialSocietyAndItsFutureAppWidget: Widget {
    let kind: String = "IndustrialSocietyAndItsFutureAppWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            IndustrialSocietyAndItsFutureAppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

struct IndustrialSocietyAndItsFutureAppWidget_Previews: PreviewProvider {
    static var previews: some View {
        IndustrialSocietyAndItsFutureAppWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
