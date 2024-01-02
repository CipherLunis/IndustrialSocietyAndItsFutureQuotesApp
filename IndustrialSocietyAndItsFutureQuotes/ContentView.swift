//
//  ContentView.swift
//  IndustrialSocietyAndItsFutureQuotes
//
//  Created by Cipher Lunis on 12/30/23.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @Binding var sentenceList: [String]
    @State var quoteIndex = 0
    @AppStorage("quote", store: UserDefaults(suiteName: "group.com.cipherlunis.IndustrialSocietyAndItsFutureQuotes.IndustrialSocietyAndItsFutureAppWidget")) var quote: String = "The Industrial Revolution and its consequences have been a disaster for the human race"
    
    let isIPad = UIDevice.current.userInterfaceIdiom == .pad
    
    init(sentenceList: Binding<[String]>) {
        self._sentenceList = sentenceList
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("BG")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("\"\(quote)\"")
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.system(size: isIPad ? 80 : 40))
                        .shadow(radius: 10)
                        .minimumScaleFactor(0.5)
                        .padding(.leading)
                        .padding(.trailing)
                        .kerning(0.8)
                    Spacer()
                        .frame(height: geo.size.height/3.5)
                }
                VStack {
                    Spacer()
                    Button {
                        quoteIndex = Int.random(in: 0..<sentenceList.count)
                        quote = sentenceList[quoteIndex]
                        print("quote: \(quote)")
                        WidgetCenter.shared.reloadAllTimelines()
                    } label: {
                        Text("New Quote")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: isIPad ? 40 : 20))
                            .frame(width: geo.size.width/1.2, height: geo.size.height/16)
                    }
                    .frame(width: geo.size.width/1.2, height: geo.size.height/16)
                    .background(.blue)
                    .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(sentenceList: .constant(TextParserHelper.parseText()))
    }
}
